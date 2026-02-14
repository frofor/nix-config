{ config, pkgs, user, ... }:

let
  scriptsDir = "${config.home.homeDirectory}/documents/scripts";
  screenshotsDir = "${config.home.homeDirectory}/pictures/screenshots";
  dexBin = "'${pkgs.dex}/bin/dex'";
  grimBin = "'${pkgs.grim}/bin/grim'";
  slurpBin = "'${pkgs.slurp}/bin/slurp'";
in
{
  home.file = {
    "${config.home.homeDirectory}/.local/bin/sk-attr" = {
      text = ''
        #!/bin/sh
        attrs=$(sed 1d)
        attr=$(printf '%s' "$attrs" | awk -F : '{print $1}' | sk -p 'Choose an attribute: ')
        [ -z "$attr" ] && exit 1

        wl-copy $(printf '%s' "$attrs" | grep "^$attr:" | sed 's/^[^:]*: *//')
        echo "Copied \033[33m$attr\033[0m to clipboard"
        notify-send "Copied $attr to clipboard"
      '';
      executable = true;
    };
    "${scriptsDir}/screenshot.sh" = {
      text = ''
        #!/bin/sh
        sel="$(${slurpBin})"
        [ "$?" -ne 0 ] && exit 1

        mkdir -p '${screenshotsDir}'
        dst="${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
        ${grimBin} -g "$sel" "$dst"

        echo "Screenshot saved to \033[33m'$dst'\033[0m"
        notify-send "Screenshot saved to '$dst'"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-journal.sh" = {
      text = ''
        #!/bin/sh
        svs=$(systemctl list-units -t service --plain --no-legend | awk '{print $1}')
        sv=$(printf '%s' "$svs" | sk -p 'Choose a service: ')
        [ -z "$sv" ] && exit 1
        journalctl -feu "$sv"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-launch.sh" = {
      text = ''
        #!/bin/sh
        apps=$(fd -e desktop . '/etc/profiles/per-user/${user}/share/applications')
        app=$(printf '%s' "$apps" | sk -p 'Choose an application: ')
        [ -z "$app" ] && exit 1

        echo "Launching \033[33m$app\033[0m..."
        notify-send "Launching $app..."
        swaymsg exec "${dexBin} '$app'"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-service.sh" = {
      text = ''
        #!/bin/sh
        act=$(printf 'status\nstart\nstop\nrestart' | sk -p 'Choose an action: ')
        case "$act" in
            ''') exit 1 ;;
            status) flags=' --all' ;;
            start|restart) flags=' --state loaded,inactive,failed' ;;
        esac

        cmd="systemctl list-units -t service$flags --plain --no-legend"
        sys=$($cmd | awk '{print "[sys] " $1}')
        usr=$($cmd --user | awk '{print "[usr] " $1}')

        sv=$(printf '%s%s' "$sys" "$usr" | sk -p 'Choose a service: ')
        case "$sv" in
            ''') exit 1 ;;
            [sys]*) flags=' --user' ;;
            *) flags=''' ;;
        esac

        cmd="systemctl $act$flags $(printf '%s' "$sv" | sed 's/^\[.*\] //')"
        if [ "$act" = status ]; then
            $cmd | less
        else
            echo "Executing \`$cmd\`..."
            notify-send "Executing \`$cmd\`..."
            $cmd
        fi
      '';
      executable = true;
    };
  };
}
