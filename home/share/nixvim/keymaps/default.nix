{
  programs.nixvim.keymaps = (import ./core.nix)
    ++ (import ./cli.nix)
    ++ (import ./dap.nix)
    ++ (import ./git.nix)
    ++ (import ./snacks.nix)
    ++ (import ./window.nix);
}
