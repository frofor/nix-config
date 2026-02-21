{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      grub.enable = false;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    kernelParams = [ "quiet" "loglevel=3" ];
    consoleLogLevel = 0;
  };
}
