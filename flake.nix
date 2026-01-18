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
      hosts.yeti = { user = "frofor"; };
    in
    {
      nixosConfigurations = builtins.mapAttrs
        (host: cfg: nixpkgs.lib.nixosSystem {
          modules = [
            ({ pkgs, ... }: import ./host/${host} {
              inherit pkgs host;
              inherit (cfg) user;
            })
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                users.${cfg.user} = import ./home/${host};
                sharedModules = [ nixvim.homeModules.nixvim ];
                extraSpecialArgs = {
                  inherit host;
                  inherit (cfg) user;
                };
              };
            }
          ];
        })
        hosts;
    };
}
