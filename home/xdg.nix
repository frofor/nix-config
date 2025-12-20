{ home }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      desktop = "${home}/desktop";
      documents = "${home}/documents";
      download = "${home}/downloads";
      music = "${home}/music";
      pictures = "${home}/pictures";
      publicShare = "${home}/public";
      templates = "${home}/templates";
      videos = "${home}/videos";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = "librewolf.desktop";
        "image/png" = "librewolf.desktop";
      };
    };
  };
}
