let
  leader = " ";
in {
  imports = [./autocmds.nix ./keymaps.nix ./options.nix ./plugins];
  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = leader;
      maplocalleader = leader;
    };
    colorscheme = "retrobox";
    clipboard.register = "unnamedplus";
  };
}
