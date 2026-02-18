{ myLib, ... }:

myLib.mkScript "sk-journal.sh" ''
  systemctl list-units -t service --plain --no-legend \
      | awk '{print $1}' \
      | sk -p 'Choose a service: ' \
      | xargs journalctl -feu
''
