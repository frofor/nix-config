{ host, ... }:

{
  networking = {
    hostName = host;
    enableIPv6 = false;
    networkmanager = {
      enable = true;
      ethernet.macAddress = "random";
      wifi = {
        macAddress = "random";
        powersave = true;
      };
    };
  };
}
