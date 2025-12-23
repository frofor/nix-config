{
  config,
  pkgs,
  user,
  ...
}:

let
  home = "/home/${user}";
  email = "18nraywczifc@protonmail.com";
  gpgKey = "35F577EAAE047585";
  font = "Iosevka NFP";
  fontMono = "Iosevka NF";
  mpvSocket = "/tmp/mpv.sock";
  mpvPkgs = with pkgs; [
    socat
    mpv
  ];
  swayPkgs = with pkgs; [
    brightnessctl
    grim
    mako
    slurp
    sway
    wlsunset
  ];
in
{
  imports = [
    (import ./foot.nix { inherit fontMono; })
    (import ./git.nix { inherit user email gpgKey; })
    ./gpg.nix
    ./helix.nix
    ./jjui.nix
    (import ./jujutsu.nix { inherit user email gpgKey; })
    ./opencode.nix
    ./keepassxc.nix
    (import ./mpv.nix { inherit mpvSocket; })
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
    packages =
      with pkgs;
      [
        gimp
        gnupg
        htop
        librewolf
        nerd-fonts.iosevka
        nil
        opencode
        skim
        tor-browser
        xdg-utils
      ]
      ++ mpvPkgs
      ++ swayPkgs;
    sessionVariables = {
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
    };
  };
}
