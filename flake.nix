{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, nur, home-manager, nixvim, ... }:
    let
      overlays = [ nur.overlays.default ];
      mkHomeModule = { host, user }: {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${user}.imports = [ ./home/${host} ];
          sharedModules = [ nixvim.homeModules.nixvim ];
          extraSpecialArgs = { inherit inputs host user; };
        };
      };
      mkSystem = { host, user, system ? "x86_64-linux" }: nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs { inherit system overlays; };
        modules = [
          ./host/${host}
          home-manager.nixosModules.home-manager
          (mkHomeModule { inherit host user; })
        ];
        specialArgs = { inherit inputs host user; };
      };
      mkHome = { host, user, system ? "x86_64-linux" }: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system overlays; };
        modules = [ ./home/${host} nixvim.homeModules.nixvim ];
        specialArgs = { inherit inputs host user; };
      };
    in
    {
      nixosConfigurations.yeti = mkSystem { host = "yeti"; user = "max"; };
      homeConfigurations.yeti = mkHome { host = "yeti"; user = "max"; };
    };
}
