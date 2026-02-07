{ pkgs, user }:

{
  users.users.${user}.shell = pkgs.zsh;
  programs = {
    zsh.enable = true;
    bash.enable = false;
  };
}
