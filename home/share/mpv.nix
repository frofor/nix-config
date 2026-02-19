{ myLib, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      input-ipc-server = myLib.mpvSocket;
      shuffle = "yes";
    };
  };
}
