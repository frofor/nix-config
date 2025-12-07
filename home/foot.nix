{ font, ... }:

{
  programs.foot = {
    enable = true;
    settings.main.font = "${font}:size=14";
  };
}
