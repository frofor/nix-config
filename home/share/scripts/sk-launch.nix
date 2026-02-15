{ pkgs, user, scriptsDir, ... }:

let
  dexBin = "'${pkgs.dex}/bin/dex'";
in
{
  home.file."${scriptsDir}/sk-launch.sh" = {
    text = ''
      #!/bin/sh
      apps=$(fd -e desktop . '/etc/profiles/per-user/${user}/share/applications')
      names=$(echo "$apps" | xargs -I {} grep -m 1 ^Name= {} | cut -d = -f 2)
      name=$(echo "$names" | sk -p 'Choose an application: ')
      [ -z "$name" ] && exit 1

      app=$(echo "$apps" | xargs -I {} grep -l "^Name=$name$" {})

      echo "Launching \033[33m$name\033[0m...\n$app"
      notify-send "Launching $name..." "$app"
      swaymsg exec "${dexBin} '$app'"
    '';
    executable = true;
  };
}
