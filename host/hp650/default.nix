{ pkgs, host, user, ... }:

{
  imports = [ ./hardware.nix ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
  hardware.graphics.enable = true;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
        users = [ user ];
        keepEnv = true;
        persist = true;
      }];
    };
  };
  networking = {
    hostName = host;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [ networkmanager-openvpn ];
    };
  };
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "audio" "networkmanager" ];
    shell = pkgs.zsh;
  };
  services = {
    getty.autologinUser = user;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    borgbackup.jobs.hp650 = {
      repo = "/mnt/backup/hp650";
      paths = [
        "/home/${user}/documents"
        "/home/${user}/downloads"
        "/home/${user}/music"
        "/home/${user}/pictures"
        "/home/${user}/videos"
        "/home/${user}/.ssh"
        "/home/${user}/.gnupg"
        "/home/${user}/.librewolf"
      ];
      encryption.mode = "none";
    };
    openvpn.servers = {
      canada = {
        config = "config \"/home/${user}/documents/vpn/canada.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      japan = {
        config = "config \"/home/${user}/documents/vpn/japan.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      mexico = {
        config = "config \"/home/${user}/documents/vpn/mexico.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      netherlands = {
        config = "config \"/home/${user}/documents/vpn/netherlands.ovpn";
        updateResolvConf = true;
        autoStart = false;
      };
      norway = {
        config = "config \"/home/${user}/documents/vpn/norway.ovpn\"";
        updateResolvConf = true;
        autoStart = false;
      };
      poland = {
        config = "config \"/home/${user}/documents/vpn/poland.ovpn\"";
        updateResolvConf = true;
        autoStart = false;
      };
      romania = {
        config = "config \"/home/${user}/documents/vpn/romania.ovpn\"";
        updateResolvConf = true;
        autoStart = false;
      };
      singapore = {
        config = "config \"/home/${user}/documents/vpn/singapore.ovpn\"";
        updateResolvConf = true;
        autoStart = false;
      };
      switzerland = {
        config = "config \"/home/${user}/documents/vpn/switzerland.ovpn\"";
        updateResolvConf = true;
        autoStart = false;
      };
      united-states = {
        config = "config \"/home/${user}/documents/vpn/united-states.ovpn\"";
        updateResolvConf = true;
      };
    };
  };
  programs.zsh.enable = true;
}
