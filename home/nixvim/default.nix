{ host, ... }:

let
  leader = " ";
in
{
  imports = [
    ./autocmds.nix
    ./keymaps.nix
    ./options.nix
    (import ./plugins { inherit host; })
  ];
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
