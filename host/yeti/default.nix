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
    networkmanager.enable = true;
  };
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "audio" "networkmanager" ];
    shell = pkgs.zsh;
  };
  services = {
    getty = {
      autologinUser = user;
      autologinOnce = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    borgbackup.jobs.${host} = {
      repo = "/mnt/backup/${host}";
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
    openvpn.servers.united-states = {
      config = "config \"/home/${user}/documents/vpn/united-states.ovpn\"";
      updateResolvConf = true;
    };
  };
  programs.zsh.enable = true;
}
