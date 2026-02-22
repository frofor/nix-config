{ config, pkgs, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
    };
    desktopEntries = {
      foot = {
        name = "";
        noDisplay = true;
      };
      footclient = {
        name = "";
        noDisplay = true;
      };
      foot-server = {
        name = "";
        noDisplay = true;
      };
      htop = {
        name = "htop";
        exec = "footclient ${pkgs.htop}/bin/htop";
      };
      librewolf-i2p = {
        name = "LibreWolf I2P";
        exec = "librewolf -p i2p";
      };
      mpv = {
        name = "mpv";
        exec = "mpv \"${config.home.homeDirectory}/music\"";
      };
      network-manager = {
        name = "NetworkManager";
        exec = "footclient nmtui";
      };
      "org.freedesktop.Xwayland" = {
        name = "";
        noDisplay = true;
      };
      umpv = {
        name = "";
        noDisplay = true;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = "librewolf.desktop";
        "image/png" = "librewolf.desktop";
        "inode/directory" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
      };
    };
  };
}
