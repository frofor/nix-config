{ pkgs, scriptsDir }:

let
  screenshotsDir = "$XDG_PICTURES_DIR/screenshots";
  dexBin = "'${pkgs.dex}/bin/dex'";
  fdBin = "'${pkgs.fd}/bin/fd'";
  grimBin = "'${pkgs.grim}/bin/grim'";
  slurpBin = "'${pkgs.slurp}/bin/slurp'";
  skBin = "'${pkgs.skim}/bin/sk'";
in
{
  home.file = {
    "${scriptsDir}/screenshot.sh" = {
      text = ''
        #!/bin/sh
        mkdir -p "${screenshotsDir}"
        ${grimBin} -g "$(${slurpBin})" "${screenshotsDir}/$(date +%Y-%m-%d-%H-%M-%S).png"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-journal.sh" = {
      text = ''
        #!/bin/sh
        services=$(systemctl list-units -t service --plain --no-legend | awk '{print $1}')
        service=$(printf "$services\n" | ${skBin} -p 'Choose a service: ')
        journalctl -feu "$service"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-launch.sh" = {
      text = ''
        #!/bin/sh
        apps=$(${fdBin} -e desktop . ~/.nix-profile/share/applications)
        app=$(printf "$apps\n" | ${skBin} -p 'Choose an application: ')
        setsid ${dexBin} "$app"
      '';
      executable = true;
    };
    "${scriptsDir}/sk-service.sh" = {
      text = ''
        #!/bin/sh
        action=$(printf 'status\nstart\nstop\nrestart\n' | ${skBin} -p 'Choose an action: ')
        case "$action" in
            status) flags=--all ;;
            start|restart) flags='--state loaded,inactive,failed' ;;
            stop) flags='''''' ;;
        esac

        services=$(systemctl list-units -t service $flags --plain --no-legend | awk '{print $1}')
        service=$(printf "$services\n" | ${skBin} -p 'Choose a service: ')
        systemctl "$action" "$service" | less
      '';
      executable = true;
    };
  };
}
