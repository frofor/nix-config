{ config, pkgs, host, user, ... }:

let
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
    (import ../share/git.nix { inherit user email gpgKey; })
    ../share/gpg.nix
    ../share/keepassxc.nix
    ../share/librewolf
    (import ../share/mpv.nix { inherit mpvSocket; })
    (import ../share/nixvim { inherit host; })
    ../share/opencode.nix
    ../share/ripgrep.nix
    ../share/rtorrent.nix
    (import ../share/scripts.nix { inherit config pkgs user; })
    ../share/session-variables.nix
    ../share/skim.nix
    (import ../share/sway.nix { inherit config pkgs font mpvSocket; })
    (import ../share/waybar.nix { inherit font; })
    ../share/wlsunset.nix
    (import ../share/xdg.nix { inherit pkgs user; })
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
