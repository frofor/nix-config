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
      htop = {
        name = "htop";
        exec = "${pkgs.foot}/bin/foot ${pkgs.htop}/bin/htop";
      };
      librewolf-i2p = {
        name = "LibreWolf I2P";
        exec = "${pkgs.librewolf}/bin/librewolf -p i2p";
      };
      network-manager = {
        name = "NetworkManager";
        exec = "${pkgs.foot}/bin/foot ${pkgs.networkmanager}/bin/nmtui-connect";
      };
      opencode = {
        name = "Opencode";
        exec = "${pkgs.foot}/bin/foot ${pkgs.opencode}/bin/opencode";
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
