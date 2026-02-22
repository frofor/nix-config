{ config, pkgs, ... }:

let
  screenshotsDir = "${config.home.homeDirectory}/pictures/screenshots";
in
pkgs.writeShellScript "snip.sh" ''
  #!/bin/sh
  set -e

  area="$(${pkgs.slurp}/bin/slurp)"
  mkdir -p '${screenshotsDir}'
  path="${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
  ${pkgs.grim}/bin/grim -g "$area" "$path"

  wl-copy "$path"
  ${pkgs.libnotify}/bin/notify-send "Screenshot saved to '$path'" 'Path copied to clipboard'
''
