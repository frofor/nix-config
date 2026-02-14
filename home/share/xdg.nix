{ pkgs, user, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      desktop = "/home/${user}/desktop";
      documents = "/home/${user}/documents";
      download = "/home/${user}/downloads";
      music = "/home/${user}/music";
      pictures = "/home/${user}/pictures";
      publicShare = "/home/${user}/public";
      templates = "/home/${user}/templates";
      videos = "/home/${user}/videos";
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
