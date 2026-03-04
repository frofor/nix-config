{ config, pkgs, ... }:

pkgs.writeShellScript "sk-playlist.sh" ''
  #!/bin/sh
  playlist=$(find '${config.home.homeDirectory}/music/playlists' -name '*.m3u' \
      | sk -p 'Choose a playlist: ' --preview '< {}') || exit 1
  swaymsg exec "umpv '$playlist'"
''
