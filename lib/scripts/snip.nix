{ config, pkgs, ... }:

let
  screenshotsDir = "${config.home.homeDirectory}/pictures/screenshots";
in
pkgs.writeShellScript "snip.sh" ''
  #!/bin/sh
  area="$('${pkgs.slurp}/bin/slurp')" || exit 1

  mkdir -p '${screenshotsDir}'
  path="${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
  '${pkgs.grim}/bin/grim' -g "$area" "$path"

  wl-copy "$path"
  '${pkgs.libnotify}/bin/notify-send' "Screenshot saved to '$path'" 'Path copied to clipboard'
''
