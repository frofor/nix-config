{ pkgs, user, ... }: let
  home = "/home/${user}";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Hasklug Nerd Font Propo";
  fontMono = "Hasklug Nerd Font Mono";
in {
  imports = [
    (import ./foot.nix { font = fontMono; })
    (import ./git.nix { inherit user email gpgKey; })
    ./gpg.nix
    ./keepassxc.nix
    ./mpv.nix
    ./nixvim
    (import ./sway.nix { inherit font; })
    (import ./waybar.nix { inherit font; })
    ./xdg.nix
    ./zsh.nix
  ];
  home = {
    stateVersion = "25.05";
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
      nerd-fonts.hasklug
      ripgrep
      rustc
      rustfmt
      socat
      sway
      tmux
    ];
  };
}
