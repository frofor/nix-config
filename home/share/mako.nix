{ font, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      inherit font;
      background-color = "#000000";
      width = 500;
      border-size = 1;
      border-color = "#00ffff";
      default-timeout = 10000;
    };
  };
}
