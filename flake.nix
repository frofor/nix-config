{
  description = "NixOS configuration";
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
  outputs = inputs@{ nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./host
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            sharedModules = [nixvim.homeModules.nixvim];
            users.frofor = import ./home;
          };
        }
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
