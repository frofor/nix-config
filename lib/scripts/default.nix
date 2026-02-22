{ config, pkgs, user, latitude, longitude, ... }:

rec {
  def = import ./def.nix { inherit pkgs; };
  pkg = import ./pkg.nix { inherit pkgs; };
  skApp = import ./sk-app.nix { inherit pkgs user; };
  skCd = import ./sk-cd.nix { inherit pkgs; };
  skExt = import ./sk-ext.nix { inherit pkgs; };
  skJournal = import ./sk-journal.nix { inherit pkgs; };
  skPass = import ./sk-pass.nix { inherit pkgs; };
  skService = import ./sk-service.nix { inherit pkgs; };
  skWeather = import ./sk-weather.nix { inherit pkgs skExt latitude longitude; };
  snip = import ./snip.nix { inherit config pkgs; };
  vwhich = import ./vwhich.nix { inherit pkgs; };
}
