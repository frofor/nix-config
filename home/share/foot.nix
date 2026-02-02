{ fontMono }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings.main.font = "${fontMono}:size=14";
  };
}
