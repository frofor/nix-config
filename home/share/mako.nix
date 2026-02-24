{ font, colors, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      inherit font;
      width = 500;
      border-size = 1;
      default-timeout = 10000;
      background-color = "#${colors.black}";
      border-color = "#${colors.orange}";
    };
  };
}
