{ config, pkgs, myLib, ... }:

let
  screenshotsDir = "${config.home.homeDirectory}/pictures/screenshots";
in
myLib.mkScript "snip.sh" ''
  sel="$('${pkgs.slurp}/bin/slurp')"
  [ $? -ne 0 ] && exit 1

  mkdir -p '${screenshotsDir}'
  dst="${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
  '${pkgs.grim}/bin/grim' -g "$sel" "$dst"

  echo "Screenshot saved to \033[33m'$dst'\033[0m"
  notify-send "Screenshot saved to '$dst'"
''
