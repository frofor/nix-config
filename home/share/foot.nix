{ fontMono, ... }:

{
  programs.foot = {
    enable = true;
    # `footclient <program>` doesn't work when `server.enable` is `true`
    settings = {
      main.font = "${fontMono}:size=16";
      "key-bindings" = {
        "scrollback-down-half-page" = "Alt+d";
        "scrollback-up-half-page" = "Alt+u";
      };
      colors = {
        foreground = "ffffff";
        background = "000000";
      };
    };
  };
}
