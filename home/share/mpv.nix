{ mpvSocket }:

{
  programs.mpv = {
    enable = true;
    config = {
      input-ipc-server = mpvSocket;
      shuffle = "yes";
    };
  };
}
