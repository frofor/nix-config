{ config, pkgs, ... }:

{
  home.file."${config.home.homeDirectory}/.local/bin/afk" = {
    text = ''
      #!/bin/sh
      trap ''' INT

      start=$(date +%s)
      '${pkgs.viu}/bin/viu' "$XDG_VIDEOS_DIR/afk.gif" -w 174 -h 37

      elapsed=$(($(date +%s) - start))
      echo "AFK for $((elapsed / 60)) minutes $((elapsed % 60)) seconds"
      notify-send "AFK for $((elapsed / 60)) minutes $((elapsed % 60)) seconds"
    '';
    executable = true;
  };
}
