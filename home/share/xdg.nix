{ user }:

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
