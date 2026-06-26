{ config, pkgs, user, latitude, longitude, ... }:

rec {
  flacCleanup = import ./flac-cleanup.nix { inherit pkgs; };
  luksClose = { uuid }: import ./luks-close.nix { inherit pkgs uuid; };
  luksOpen = { uuid }: import ./luks-open.nix { inherit pkgs uuid; };
  skApp = import ./sk-app.nix { inherit pkgs user; };
  skCd = import ./sk-cd.nix { inherit pkgs; };
  skExt = import ./sk-ext.nix { inherit pkgs; };
  skJournal = import ./sk-journal.nix { inherit pkgs; };
  skService = import ./sk-service.nix { inherit pkgs; };
  skWeather = import ./sk-weather.nix { inherit pkgs skExt latitude longitude; };
  snip = import ./snip.nix { inherit config pkgs; };
}
