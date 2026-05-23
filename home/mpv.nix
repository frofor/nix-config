{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      shuffle = "yes";
      save-watch-history = "yes";
    };
    scripts = with pkgs.mpvScripts; [ mpris mpv-notify-send ];
  };
}
