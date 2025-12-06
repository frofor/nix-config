let
  inherit (builtins) getEnv;
in {
  programs.mpv = {
    enable = true;
    config = {
      shuffle = "yes";
      input-ipc-server = getEnv "XDG_RUNTIME_DIR";
    };
  };
}
