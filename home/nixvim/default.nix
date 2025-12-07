{ host }:

{
  imports = [
    ./autocmds.nix
    ./cmp.nix
    ./dap.nix
    ./gitsigns.nix
    ./keymaps.nix
    (import ./lsp { inherit host; })
    ./options.nix
    ./snacks.nix
    ./supermaven.nix
  ];
  programs.nixvim.enable = true;
}
