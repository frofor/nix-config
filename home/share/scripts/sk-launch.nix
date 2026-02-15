{ pkgs, user, scriptsDir, ... }:

let
  dexBin = "'${pkgs.dex}/bin/dex'";
in
{
  home.file."${scriptsDir}/sk-launch.sh" = {
    text = ''
      #!/bin/sh
      apps=$(fd -e desktop . '/etc/profiles/per-user/${user}/share/applications')
      app=$(printf %s "$apps" | sk -p 'Choose an application: ')
      [ -z "$app" ] && exit 1

      echo "Launching \033[33m$app\033[0m..."
      notify-send "Launching $app..."
      swaymsg exec "${dexBin} '$app'"
    '';
    executable = true;
  };
}
