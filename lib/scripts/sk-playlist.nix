{ pkgs, ... }:

pkgs.writeShellScript "sk-playlist.sh" ''
  #!/bin/sh
  playlist=$(find "$(xdg-user-dir MUSIC)" -name '*.m3u' | sk -p 'Choose a playlist: ') || exit 1
  swaymsg exec "umpv '$playlist'"
''
