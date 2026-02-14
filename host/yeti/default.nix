{ pkgs, host, user, ... }:

{
  imports = [
    ./hardware.nix
    (import ./vpn.nix { inherit user; })
    ../share/boot.nix
    (import ../share/doas.nix { inherit user; })
    (import ../share/getty.nix { inherit user; })
    (import ../share/network.nix { inherit host; })
    ../share/pipewire.nix
    ../share/printing.nix
    ../share/rtorrent.nix
    (import ../share/zsh.nix { inherit pkgs user; })
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
  hardware.graphics.enable = true;
  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    localBinInPath = true;
  };
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "audio" "networkmanager" "kvm" "adbusers" ];
  };
}
