{ config, pkgs, publicKeys, ... }:

{
  programs.gpg = {
    inherit publicKeys;
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-tty;
  };
}
