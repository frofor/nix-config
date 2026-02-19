{ config, pkgs, ... }:

{
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (ex: with ex; [ pass-otp ]);
    settings.PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
  };
}
