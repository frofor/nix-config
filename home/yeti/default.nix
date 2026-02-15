{ config, pkgs, user, ... }:

let
  nick = "frofor";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
  mpvSocket = "/run/user/1000/mpv.sock";
in
{
  imports = [
    ../share/fd.nix
    (import ../share/foot.nix { inherit fontMono; })
    (import ../share/git.nix { inherit nick email gpgKey; })
    ../share/gpg.nix
    ../share/keepassxc.nix
    ../share/librewolf
    ../share/mako.nix
    (import ../share/mpv.nix { inherit mpvSocket; })
    ../share/nixvim
    ../share/opencode.nix
    ../share/ripgrep.nix
    ../share/rtorrent.nix
    ../share/scripts
    ../share/session-variables.nix
    ../share/skim.nix
    (import ../share/sway.nix { inherit config pkgs font mpvSocket; })
    (import ../share/waybar.nix { inherit font; })
    ../share/wlsunset.nix
    ../share/xdg.nix
    ../share/zsh.nix
  ];
  home = {
    stateVersion = "25.11";
    username = user;
    homeDirectory = "/home/${user}";
    packages = with pkgs; [
      android-tools
      gimp
      ipe
      libnotify
      libreoffice
      monero-cli
      nerd-fonts.iosevka
      nil
      (pass.withExtensions (xs: with xs; [ pass-otp ]))
      (texliveBasic.withPackages (ps: with ps; [ xetex ]))
      tor-browser
      trash-cli
      wl-clipboard
      xdg-utils
    ];
  };
}
