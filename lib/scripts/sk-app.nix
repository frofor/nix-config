{ pkgs, user, ... }:

pkgs.writeShellScript "sk-app.sh" ''
  #!/bin/sh
  apps="$(find '/etc/profiles/per-user/${user}/share/applications' \
      -name '*.desktop' \
      -exec grep -L ^NoDisplay=true$ {} +)"
  name="$(printf '%s\n' "$apps" \
      | xargs -I {} grep -m 1 ^Name= {} \
      | cut -d= -f2 \
      | sort -V \
      | sk -p 'Choose an application: ')" || exit 1
  app="$(printf '%s\n' "$apps" | xargs -I {} grep -l "^Name=$name$" {})"

  ${pkgs.libnotify}/bin/notify-send "Launching $name..." "$app"
  swaymsg exec "${pkgs.dex}/bin/dex '$app'"
''
