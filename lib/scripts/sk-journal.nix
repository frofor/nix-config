{ pkgs, ... }:

pkgs.writeShellScript "sk-journal.sh" ''
  #!/bin/sh
  systemctl list-units -t service --plain --no-legend \
      | awk '{print $1}' \
      | sort -V -t. -k1,1 \
      | sk -p 'Choose a service: ' \
      | xargs journalctl -feu
''
