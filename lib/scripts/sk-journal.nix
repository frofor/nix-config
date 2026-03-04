{ pkgs, ... }:

pkgs.writeShellScript "sk-journal.sh" ''
  #!/bin/sh
  service=$(systemctl list-units -t service --plain --no-legend \
      | awk '{print $1}' \
      | sort -Vt. -k1,1 \
      | sk -p 'Choose a service: ') || exit 1
  journalctl -feu "$service"
''
