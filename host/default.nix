{ pkgs, user, ... }:

{
  imports = [
    ./boot.nix
    ./cups.nix
    ./doas.nix
    ./getty.nix
    ./hardware.nix
    ./monero.nix
    ./network.nix
    ./pipewire.nix
    ./qmk.nix
    ./rtorrent.nix
    ./vpn.nix
    ./zsh.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
  hardware.graphics.enable = true;
  environment.binsh = "${pkgs.dash}/bin/dash";
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "audio" "networkmanager" "kvm" "adbusers" ];
  };
}
