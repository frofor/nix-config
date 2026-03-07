{ pkgs, ... }:

pkgs.writeShellScript "sk-playlist.sh" ''
  #!/bin/sh
  playlist=$(find "$XDG_MUSIC_DIR" -name '*.m3u' | sk -p 'Choose a playlist: ') || exit 1
  swaymsg exec "umpv '$playlist'"
''
