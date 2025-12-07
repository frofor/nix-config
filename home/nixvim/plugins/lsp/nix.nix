{ host, ... }:

let
  options = "(builtins.getFlake (\"git+file://\" + toString ./.)).nixosConfigurations.\"${host}\".options";
in
{
  programs.nixvim.plugins.lsp.servers.nixd = {
    enable = true;
    settings = {
      nixpkgs.expr = "import <nixpkgs> {}";
      formatting.command = [ "nixpkgs-fmt" ];
      options = {
        nixos.expr = options;
        home-manager.expr = options + ".home-manager.users.type.getSubOptions []";
      };
    };
  };
}
