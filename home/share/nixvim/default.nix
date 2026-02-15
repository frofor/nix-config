{
  imports = [
    ./autocmds.nix
    ./cmp.nix
    ./dap.nix
    ./gitsigns.nix
    ./keymaps.nix
    ./lsp
    ./options.nix
    ./snacks.nix
    ./supermaven.nix
    ./vague.nix
  ];
  programs.nixvim.enable = true;
}
