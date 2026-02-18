{ pkgs, myLib, user, ... }:

myLib.mkScript "sk-app.sh" ''
  apps="$(find '/etc/profiles/per-user/${user}/share/applications' -name '*.desktop')"
  name="$(echo "$apps" \
      | xargs -I {} grep -m 1 ^Name= {} \
      | cut -d = -f 2 \
      | sk -p 'Choose an application: ')" || exit 1
  app="$(echo "$apps" | xargs -I {} grep -l "^Name=$name$" {})"

  '${pkgs.libnotify}/bin/notify-send' "Launching $name..." "$app"
  swaymsg exec "'${pkgs.dex}/bin/dex' '$app'"
''
