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
  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      user = "frofor";
      host = "nixos";
    in
    {
      nixosConfigurations.${host} = nixosSystem {
        modules = [
          ({ pkgs, ... }: import ./host { inherit pkgs user host; })
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.${user} = import ./home;
              sharedModules = [ nixvim.homeModules.nixvim ];
              extraSpecialArgs = { inherit user host; };
            };
          }
        ];
      };
    };
}
