{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelParams = [ "quiet" "loglevel=3" ];
    consoleLogLevel = 0;
  };
}
