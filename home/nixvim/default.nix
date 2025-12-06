let
  leader = " ";
in {
  imports = [./autocmds.nix ./keymaps.nix ./options.nix ./plugins];
  programs.nixvim = {
    enable = true;
    colorschemes.vague.enable = true;
    clipboard.register = "unnamedplus";
    globals = {
      mapleader = leader;
      maplocalleader = leader;
    };
  };
}
