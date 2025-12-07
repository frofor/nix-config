{ host }:

{
  imports = [
    ./rust.nix
    (import ./nix.nix { inherit host; })
  ];
  programs.nixvim.plugins.lsp.enable = true;
}
