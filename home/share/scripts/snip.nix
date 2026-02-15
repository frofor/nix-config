{ config, pkgs, scriptsDir, ... }:

let
  screenshotsDir = "${config.home.homeDirectory}/pictures/screenshots";
  grimBin = "'${pkgs.grim}/bin/grim'";
  slurpBin = "'${pkgs.slurp}/bin/slurp'";
in
{
  home.file."${scriptsDir}/snip.sh" = {
    text = ''
      #!/bin/sh
      sel="$(${slurpBin})"
      [ $? -ne 0 ] && exit 1

      mkdir -p '${screenshotsDir}'
      dst="${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
      ${grimBin} -g "$sel" "$dst"

      echo "Screenshot saved to \033[33m'$dst'\033[0m"
      notify-send "Screenshot saved to '$dst'"
    '';
    executable = true;
  };
}
