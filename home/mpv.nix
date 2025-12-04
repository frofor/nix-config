let
  inherit (builtins) getEnv;
in
{
  enable = true;
  config = {
    shuffle = "yes";
    input-ipc-server = getEnv "XDG_RUNTIME_DIR";
  };
}
