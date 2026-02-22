{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config.shuffle = "yes";
    scripts = with pkgs.mpvScripts; [ mpris mpv-notify-send ];
  };
}
