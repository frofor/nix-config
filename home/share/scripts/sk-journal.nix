{ myLib, ... }:

myLib.mkScript "sk-journal.sh" ''
  sv="$(systemctl list-units -t service --plain --no-legend | awk '{print $1}')"
  journalctl -feu "$(echo "$sv" | sk -p 'Choose a service: ')" || exit 1
''
