{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations.hp650 =
      let
        host = "hp650";
        user = "frofor";
      in
      nixpkgs.lib.nixosSystem {
        modules = [
          ({ pkgs, ... }: import ./host/${host} { inherit pkgs host user; })
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.${user} = import ./home/${host};
              sharedModules = [ nixvim.homeModules.nixvim ];
              extraSpecialArgs = { inherit host user; };
            };
          }
        ];
      };
  };
}
