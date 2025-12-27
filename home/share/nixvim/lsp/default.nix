{ host }:

{
  imports = [
    ./haskell.nix
    (import ./nix.nix { inherit host; })
    ./python.nix
    ./rust.nix
    ./zig.nix
  ];
  programs.nixvim.plugins.lsp.enable = true;
}
