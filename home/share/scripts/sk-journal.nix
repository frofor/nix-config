{ myLib, ... }:

myLib.mkScript "sk-journal.sh" ''
  svs=$(systemctl list-units -t service --plain --no-legend | awk '{print $1}')
  sv=$(echo "$svs" | sk -p 'Choose a service: ')
  [ -z "$sv" ] && exit 1
  journalctl -feu "$sv"
''
