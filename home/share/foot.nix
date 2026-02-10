{ fontMono }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main.font = "${fontMono}:size=14";
      "key-bindings" = {
        "scrollback-down-half-page" = "Alt+d";
        "scrollback-up-half-page" = "Alt+u";
      };
    };
  };
}
