{ config, pkgs, user, ... }:

let
  myLib = import ../../lib { inherit config pkgs user; };
  nick = "frofor";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
in
{
  imports = [
    ../share
    ../share/fd.nix
    (import ../share/foot.nix { inherit fontMono; })
    (import ../share/git.nix { inherit nick email gpgKey; })
    ../share/gpg.nix
    ../share/keepassxc.nix
    ../share/librewolf
    (import ../share/mako.nix { inherit font; })
    (import ../share/mpv.nix { inherit myLib; })
    ../share/nixvim
    ../share/opencode.nix
    ../share/pass.nix
    ../share/ripgrep.nix
    ../share/rtorrent.nix
    ../share/session-variables.nix
    ../share/shell-aliases.nix
    ../share/skim.nix
    ../share/translate-shell.nix
    (import ../share/sway.nix { inherit pkgs myLib font; })
    (import ../share/waybar.nix { inherit font; })
    ../share/wlsunset.nix
    ../share/xdg.nix
    ../share/zsh.nix
  ];
  home.packages = with pkgs; [
    android-tools
    gimp
    libreoffice
    monero-cli
    myLib.scripts.def
    myLib.scripts.pkg
    myLib.scripts.vwhich
    nerd-fonts.iosevka
    nil
    (texliveBasic.withPackages (ps: with ps; [ xetex ]))
    tor-browser
    trash-cli
    wl-clipboard
    xdg-utils
  ];
}
