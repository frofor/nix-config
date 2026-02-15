{ pkgs, user, ... }:

{
  imports = [
    ./hardware.nix
    ./vpn.nix
    ../share/boot.nix
    ../share/doas.nix
    ../share/getty.nix
    ../share/network.nix
    ../share/pipewire.nix
    ../share/printing.nix
    ../share/rtorrent.nix
    ../share/zsh.nix
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
