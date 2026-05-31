{ config, pkgs, user, ... }:

let
  nick = "frofor";
  email = "18nraywczifc@protonmail.com";
  latitude = "51.83";
  longitude = "10.78";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
  gpgKey = "35F577EAAE047585";
  publicKeys = [
    { source = ./gpg/frofor.asc; trust = 5; }
    { source = ./gpg/pass.asc; trust = 5; }
    { source = ./gpg/qtroo.asc; trust = 5; }
  ];
  colors = {
    black = "000000";
    white = "ffffff";
    red = "ff0000";
    orange = "ff5a00";
    yellow = "ffff00";
    green = "00ff00";
    blue = "0000ff";
  };
  myLib = import ../lib { inherit config pkgs user latitude longitude; };
in
{
  imports = [
    ./fd.nix
    (import ./foot.nix { inherit fontMono colors; })
    (import ./git.nix { inherit nick email gpgKey; })
    (import ./gpg.nix { inherit config pkgs publicKeys; })
    ./keepassxc.nix
    (import ./librewolf { inherit pkgs colors; })
    (import ./mako.nix { inherit font colors; })
    ./mpv.nix
    ./nixvim
    ./opencode.nix
    ./pass.nix
    ./ripgrep.nix
    ./rtorrent.nix
    ./session-variables.nix
    ./shell-aliases.nix
    (import ./skim.nix { inherit colors; })
    (import ./sway.nix { inherit pkgs myLib font colors; })
    ./translate-shell.nix
    (import ./waybar.nix { inherit font colors; })
    (import ./wlsunset.nix { inherit latitude longitude; })
    (import ./xdg.nix { inherit config pkgs myLib; })
    ./zsh.nix
  ];
  home = {
    stateVersion = "25.11";
    username = user;
    homeDirectory = "/home/${user}";
    packages = with pkgs; [
      android-tools
      gimp
      git-lfs
      godot
      libreoffice
      monero-cli
      myLib.scripts.flacCleanup
      (myLib.scripts.luksClose { uuid = "63a1f746-70ed-4fd8-9be0-0c67d99025f6"; })
      (myLib.scripts.luksOpen { uuid = "63a1f746-70ed-4fd8-9be0-0c67d99025f6"; })
      myLib.scripts.vwhich
      nerd-fonts.iosevka
      nil
      qmk
      tor-browser
      trash-cli
      ungoogled-chromium
      wl-clipboard
      xdg-utils
    ];
  };
}
