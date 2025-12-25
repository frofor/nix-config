{
  pkgs,
  user,
  host,
  ...
}:

{
  imports = [ ./hardware.nix ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.11";
  hardware.graphics.enable = true;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  networking = {
    hostName = host;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [ networkmanager-openvpn ];
    };
  };
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "audio"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };
  services = {
    getty.autologinUser = user;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openvpn.servers = {
      canada = {
        config = "config /home/frofor/documents/vpn/canada.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      japan = {
        config = "config /home/frofor/documents/vpn/japan.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      mexico = {
        config = "config /home/frofor/documents/vpn/mexico.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      netherlands = {
        config = "config /home/frofor/documents/vpn/netherlands.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      norway = {
        config = "config /home/frofor/documents/vpn/norway.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      poland = {
        config = "config /home/frofor/documents/vpn/poland.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      romania = {
        config = "config /home/frofor/documents/vpn/romania.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      singapore = {
        config = "config /home/frofor/documents/vpn/singapore.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      switzerland = {
        config = "config /home/frofor/documents/vpn/switzerland.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      united-states = {
        config = "config /home/frofor/documents/vpn/united-states.ovpn";
        updateResolvConf = true;
      };
    };
  };
  programs.zsh.enable = true;
}
