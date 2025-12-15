{ config, pkgs, user, host, ... }:

let
  home = "/home/${user}";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
  mpvSocket = "/tmp/mpv.sock";
  mpvPackages = with pkgs; [ socat mpv ];
  nixvimPackages = with pkgs; [ fd ripgrep ];
in
{
  imports = [
    (import ./foot.nix { inherit fontMono; })
    (import ./git.nix { inherit user email gpgKey; })
    ./gpg.nix
    ./opencode.nix
    ./keepassxc.nix
    (import ./mpv.nix { inherit mpvSocket; })
    (import ./nixvim { inherit host; })
    ./skim.nix
    (import ./sway.nix { inherit font mpvSocket; })
    (import ./waybar.nix { inherit font; })
    ./wlsunset.nix
    (import ./xdg.nix { inherit home; })
    ./zsh.nix
  ];
  home = {
    stateVersion = "25.11";
    username = user;
    homeDirectory = home;
    packages = with pkgs; [
      brightnessctl
      gnupg
      htop
      keepassxc
      librewolf
      nerd-fonts.iosevka
      opencode
      skim
      sway
      tor-browser
      tmux
      wlsunset
      xdg-utils
    ] ++ mpvPackages ++ nixvimPackages;
    sessionVariables = {
      EDITOR = "nvim";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
    };
  };
}
