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
        key=$(printf "$attrs" | awk -F : '{print $1}' | sk)
        wl-copy $(printf "$attrs" | grep "^$key:" | sed 's/^[^:]*: *//')
        echo "Copied \033[33m$key\033[0m to clipboard."
      '';
      executable = true;
    };
    "${scriptsDir}/screenshot.sh" = {
      text = ''
        #!/bin/sh
        mkdir -p '${screenshotsDir}'
        ${grimBin} -g "$(${slurpBin})" "${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-journal.sh" = {
      text = ''
        #!/bin/sh
        svs=$(systemctl list-units -t service --plain --no-legend | awk '{print $1}')
        sv=$(printf "%s\n" "$svs" | sk -p 'Choose a service: ')
        journalctl -feu "$sv"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-launch.sh" = {
      text = ''
        #!/bin/sh
        apps=$(fd -e desktop . '/etc/profiles/per-user/${user}/share/applications')
        app=$(printf "%s\n" "$apps" | sk -p 'Choose an application: ')
        swaymsg exec "${dexBin} '$app'"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-service.sh" = {
      text = ''
        #!/bin/sh
        action=$(printf 'status\nstart\nstop\nrestart\n' | sk -p 'Choose an action: ')
        case "$action" in
            status) flags=--all ;;
            start|restart) flags='--state loaded,inactive,failed' ;;
        esac

        sys=$(systemctl list-units -t service $flags --plain --no-legend | awk '{print $1}')
        usr=$(systemctl list-units -t service $flags --user --plain --no-legend | awk '{print $1}')
        sv=$(printf "%s\n%s\n" "$sys" "$usr" | sk -p 'Choose a service: ')

        echo "$usr" | grep -q "^$sv$" && flags=--user || flags='''
        systemctl "$action" $flags "$sv" | less
      '';
      executable = true;
    };
  };
}
