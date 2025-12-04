{ pkgs, ... }:

let
  user = "frofor";
in
{
  imports = [./hardware.nix];
  system.stateVersion = "25.05";
  hardware.graphics.enable = true;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [networkmanager-openvpn];
    };
  };
  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "audio" "networkmanager"];
    shell = pkgs.zsh;
  };
  services = {
    getty.autologinUser = user;
    openvpn.servers = {};
    pulseaudio.enable = true;
  };
  programs.zsh.enable = true;
}
