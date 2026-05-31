{
  imports = [ ./haskell.nix ./java.nix ./lean.nix ./nix.nix ./python.nix ./rust.nix ./zig.nix ];
  programs.nixvim.plugins.lsp.enable = true;
}
