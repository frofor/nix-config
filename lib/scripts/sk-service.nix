{ pkgs, ... }:

pkgs.writeShellScript "sk-service.sh" ''
  #!/bin/sh
  act=$(printf 'status\nstart\nstop\nrestart' | sk -p 'Choose an action: ') || exit 1
  case $act in
      status) flags=' --all' ;;
      start|restart) flags=' --state loaded,inactive,failed' ;;
  esac

  cmd="systemctl list-units -t service$flags --plain --no-legend"
  sys="$($cmd | awk '{print "[sys] " $1}')"
  usr="$($cmd --user | awk '{print "[usr] " $1}')"

  sv="$(printf '%s\n%s' "$sys" "$usr" | sk -p 'Choose a service: ')" || exit 1
  case "$sv" in
      [sys]*) flags=' --user' ;;
      *) flags=''' ;;
  esac

  cmd="systemctl $act$flags $(printf %s "$sv" | sed 's/^\[.*\] //')"
  if [ $act = status ]; then
      $cmd | less
  else
      '${pkgs.libnotify}/bin/notify-send' "Executing \`$cmd\`..."
      $cmd
  fi
''
