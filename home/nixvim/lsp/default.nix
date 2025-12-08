{ host }:

{
  imports = [
    ./haskell.nix
    (import ./nix.nix { inherit host; })
    ./rust.nix
  ];
  programs.nixvim.plugins.lsp.enable = true;
}
