{ config, pkgs, host, user, ... }:

let
  scriptsDir = "/home/${user}/documents/scripts";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
  mpvSocket = "$XDG_RUNTIME_DIR/mpv.sock";
  swayPkgs = with pkgs; [ sway wlsunset ];
  nixvimPkgs = with pkgs; [ fd ripgrep ];
in
{
  imports = [
    (import ../share/foot.nix { inherit fontMono; })
    (import ../share/git.nix { inherit user email gpgKey; })
    ../share/gpg.nix
    ../share/keepassxc.nix
    ../share/librewolf
    (import ../share/mpv.nix { inherit mpvSocket; })
    (import ../share/nixvim { inherit host; })
    ../share/opencode.nix
    (import ../share/scripts.nix { inherit pkgs scriptsDir; })
    ../share/skim.nix
    (import ../share/sway.nix { inherit pkgs scriptsDir font mpvSocket; })
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
      mpv
      nerd-fonts.iosevka
      nil
      opencode
      rtorrent
      tor-browser
      trash-cli
      wl-clipboard
      xdg-utils
    ]
    ++ swayPkgs
    ++ nixvimPkgs;
    sessionVariables = {
      EDITOR = "nvim";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
    };
  };
}
