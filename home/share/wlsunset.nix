{ latitude, longitude, ... }:

{
  services.wlsunset = {
    inherit latitude longitude;
    enable = true;
  };
}
