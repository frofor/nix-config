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
    firewall.allowedTCPPorts = [
      4355 # chess-online
      37000 # simplex
    ];
  };
}
