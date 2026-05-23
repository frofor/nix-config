{ user, ... }:

{
  services.openvpn.servers.united-states = {
    config = "config \"/home/${user}/documents/vpn/united-states.ovpn\"";
    updateResolvConf = true;
  };
}
