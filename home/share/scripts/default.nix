{ config, pkgs, user, ... }:

let
  scriptsDir = "${config.home.homeDirectory}/documents/scripts";
in
{
  imports = [
    ./afk.nix
    ./sk-attr.nix
    (import ./sk-journal.nix { inherit scriptsDir; })
    (import ./sk-launch.nix { inherit pkgs user scriptsDir; })
    (import ./sk-service.nix { inherit scriptsDir; })
    (import ./snip.nix { inherit config pkgs scriptsDir; })
  ];
}
