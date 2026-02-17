{ config, pkgs, myLib, ... }:

let
  screenshotsDir = "${config.home.homeDirectory}/pictures/screenshots";
in
myLib.mkScript "snip.sh" ''
  area="$('${pkgs.slurp}/bin/slurp')" || exit 1

  mkdir -p '${screenshotsDir}'
  path="${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
  '${pkgs.grim}/bin/grim' -g "$area" "$path"

  echo "Screenshot saved to \033[33m'$path'\033[0m"
  '${pkgs.libnotify}/bin/notify-send' "Screenshot saved to '$path'"
''
