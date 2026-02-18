{ pkgs, myLib, ... }:

myLib.mkScriptLocalBin "afk" ''
  start=$(date +%s)
  mpv --vo=caca --loop "$XDG_VIDEOS_DIR/afk.gif"

  elapsed=$(($(date +%s) - start))
  '${pkgs.libnotify}/bin/notify-send' "AFK for $((elapsed / 60)) minutes $((elapsed % 60)) seconds"
''
