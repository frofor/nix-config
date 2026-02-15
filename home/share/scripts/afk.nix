{ config, ... }:

{
  home.file."${config.home.homeDirectory}/.local/bin/afk" = {
    text = ''
      #!/bin/sh
      start=$(date +%s)
      mpv --vo=caca --loop "$XDG_VIDEOS_DIR/afk.gif"

      elapsed=$(($(date +%s) - start))
      echo "AFK for $((elapsed / 60)) minutes $((elapsed % 60)) seconds"
      notify-send "AFK for $((elapsed / 60)) minutes $((elapsed % 60)) seconds"
    '';
    executable = true;
  };
}
