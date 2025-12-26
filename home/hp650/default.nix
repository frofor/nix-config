{ config, pkgs, host, user, ... }:

let
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
  mpvSocket = "/tmp/mpv.sock";
  mpvPkgs = with pkgs; [ socat mpv ];
  swayPkgs = with pkgs; [ brightnessctl grim mako slurp sway wlsunset ];
  nixvimPkgs = with pkgs; [ fd ripgrep ];
in
{
  imports = [
    (import ../share/foot.nix { inherit fontMono; })
    (import ../share/git.nix { inherit user email gpgKey; })
    ../share/gpg.nix
    ../share/jjui.nix
    (import ../share/jujutsu.nix { inherit user email gpgKey; })
    ../share/opencode.nix
    ../share/keepassxc.nix
    (import ../share/mpv.nix { inherit mpvSocket; })
    (import ../share/nixvim { inherit host; })
    ../share/skim.nix
    (import ../share/sway.nix { inherit font mpvSocket; })
    (import ../share/waybar.nix { inherit font; })
    ../share/wlsunset.nix
    (import ../share/xdg.nix { inherit user; })
    ../share/zsh.nix
  ];
  home = {
    stateVersion = "25.11";
    username = user;
    homeDirectory = "/home/${user}";
    packages = with pkgs;
      [ gimp gnupg htop librewolf nerd-fonts.iosevka nil opencode skim tor-browser xdg-utils ]
      ++ mpvPkgs
      ++ swayPkgs
      ++ nixvimPkgs;
    sessionVariables = {
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
    };
  };
}
