{ host }:

{
  imports = [
    ./haskell.nix
    (import ./nix.nix { inherit host; })
    ./rust.nix
    ./zig.nix
  ];
  programs.nixvim.plugins.lsp.enable = true;
}
