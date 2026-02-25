{ config, pkgs, ... }:

pkgs.writeShellScript "sk-playlist.sh" ''
  #!/bin/sh
  set -e
  find '${config.home.homeDirectory}/music/playlists' -name '*.m3u' \
      | sk -p 'Choose a playlist: ' --preview '< {}' \
      | xargs -I {} swaymsg exec "umpv '{}'"
''
