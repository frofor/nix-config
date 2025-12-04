{ config, pkgs, ... }:

let
  user = "frofor";
  home = "/home/${user}";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Hasklug Nerd Font Propo";
  fontMono = "Hasklug Nerd Font Mono";
in
{
  home = {
    stateVersion = "25.05";
    username = user;
    homeDirectory = home;
    packages = with pkgs; [
      brightnessctl
      gnupg
      keepassxc
      librewolf
      mpv
      nerd-fonts.hasklug
      socat
      sway
      tmux
      ripgrep
    ];
  };
  xdg = import ./xdg.nix { inherit home; };
  wayland.windowManager.sway = import ./sway.nix { inherit font; };
  programs = {
    foot = import ./foot.nix { font = fontMono; };
    git = import ./git.nix { inherit user email gpgKey; };
    keepassxc = import ./keepassxc.nix;
    nixvim = import ./nixvim.nix { inherit config; };
    mpv = import ./mpv.nix;
    waybar = import ./waybar.nix { inherit font; };
    zsh = import ./zsh.nix;
  };
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-tty;
  };
}
