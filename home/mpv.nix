{ mpvSocket }:

{
  programs.mpv = {
    enable = true;
    config = {
      input-ipc-server = mpvSocket;
      pause = "yes";
      shuffle = "yes";
    };
  };
}
