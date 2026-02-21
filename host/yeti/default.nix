{ pkgs, user, ... }:

{
  imports = [
    ./hardware.nix
    ./vpn.nix
    ../share/boot.nix
    ../share/cups.nix
    ../share/doas.nix
    ../share/getty.nix
    ../share/network.nix
    ../share/pipewire.nix
    ../share/rtorrent.nix
    ../share/zsh.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
  hardware.graphics.enable = true;
  environment.binsh = "${pkgs.dash}/bin/dash";
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "audio" "networkmanager" "kvm" "adbusers" ];
  };
}
