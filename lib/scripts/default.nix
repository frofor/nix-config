{ config, pkgs, user, latitude, longitude, ... }:

rec {
  def = import ./def.nix { inherit pkgs; };
  luksClose = { uuid }: import ./luks-close.nix { inherit pkgs uuid; };
  luksOpen = { uuid, passEntry }: import ./luks-open.nix { inherit pkgs uuid passEntry; };
  pkg = import ./pkg.nix { inherit pkgs; };
  skApp = import ./sk-app.nix { inherit pkgs user; };
  skCd = import ./sk-cd.nix { inherit pkgs; };
  skExt = import ./sk-ext.nix { inherit pkgs; };
  skJournal = import ./sk-journal.nix { inherit pkgs; };
  skPass = import ./sk-pass.nix { inherit pkgs; };
  skPlaylist = import ./sk-playlist.nix { inherit pkgs; };
  skService = import ./sk-service.nix { inherit pkgs; };
  skWeather = import ./sk-weather.nix { inherit pkgs skExt latitude longitude; };
  snip = import ./snip.nix { inherit config pkgs; };
  vwhich = import ./vwhich.nix { inherit pkgs; };
}
