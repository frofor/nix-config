{ scriptsDir, ... }:

{
  home.file."${scriptsDir}/sk-service.sh" = {
    text = ''
      #!/bin/sh
      act=$(printf 'status\nstart\nstop\nrestart' | sk -p 'Choose an action: ')
      case $act in
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
      if [ $act = status ]; then
          $cmd | less
      else
          echo "Executing \`$cmd\`..."
          notify-send "Executing \`$cmd\`..."
          $cmd
      fi
    '';
    executable = true;
  };
}
