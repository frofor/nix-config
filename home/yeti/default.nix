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
  myLib = import ../../lib { inherit config pkgs user latitude longitude; };
in
{
  imports = [
    ../share
    ../share/fd.nix
    (import ../share/foot.nix { inherit fontMono colors; })
    (import ../share/git.nix { inherit nick email gpgKey; })
    (import ../share/gpg.nix { inherit config pkgs publicKeys; })
    ../share/keepassxc.nix
    (import ../share/librewolf { inherit pkgs colors; })
    (import ../share/mako.nix { inherit font colors; })
    ../share/mpv.nix
    ../share/nixvim
    ../share/opencode.nix
    ../share/pass.nix
    ../share/ripgrep.nix
    ../share/rtorrent.nix
    ../share/session-variables.nix
    ../share/shell-aliases.nix
    (import ../share/skim.nix { inherit colors; })
    (import ../share/sway.nix { inherit pkgs myLib font colors; })
    ../share/translate-shell.nix
    (import ../share/waybar.nix { inherit font colors; })
    (import ../share/wlsunset.nix { inherit latitude longitude; })
    (import ../share/xdg.nix { inherit config pkgs myLib; })
    ../share/zsh.nix
  ];
  home.packages = with pkgs; [
    android-tools
    gimp
    git-lfs
    godot
    libreoffice
    monero-cli
    myLib.scripts.def
    (myLib.scripts.luksClose { uuid = "63a1f746-70ed-4fd8-9be0-0c67d99025f6"; })
    (myLib.scripts.luksOpen { uuid = "63a1f746-70ed-4fd8-9be0-0c67d99025f6"; passEntry = "disk"; })
    myLib.scripts.pkg
    myLib.scripts.vwhich
    nerd-fonts.iosevka
    nil
    tor-browser
    trash-cli
    wl-clipboard
    xdg-utils
  ];
}
