{ pkgs, myLib, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      input-ipc-server = myLib.mpvSocket;
      shuffle = "yes";
    };
    scripts = with pkgs.mpvScripts; [ mpv-notify-send ];
  };
}
