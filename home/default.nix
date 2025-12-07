{ pkgs, user, host, ... }:

let
  home = "/home/${user}";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
  mpvSocket = "/tmp/mpv.sock";
in
{
  imports = [
    (import ./foot.nix { inherit fontMono; })
    (import ./git.nix { inherit user email gpgKey; })
    ./gpg.nix
    ./keepassxc.nix
    (import ./mpv.nix { inherit mpvSocket; })
    (import ./nixvim { inherit host; })
    ./skim.nix
    (import ./sway.nix { inherit font mpvSocket; })
    (import ./waybar.nix { inherit font; })
    (import  ./xdg.nix { inherit home; })
    ./zsh.nix
  ];
  home = {
    stateVersion = "25.11";
    username = user;
    homeDirectory = home;
    packages = with pkgs; [
      brightnessctl
      cargo
      fd
      gcc
      gnupg
      keepassxc
      librewolf
      lldb
      mpv
      nerd-fonts.iosevka
      ripgrep
      rustc
      rustfmt
      socat
      skim
      sway
      tmux
    ];
  };
}
