{ scriptsDir, ... }:

{
  home.file."${scriptsDir}/sk-journal.sh" = {
    text = ''
      #!/bin/sh
      svs=$(systemctl list-units -t service --plain --no-legend | awk '{print $1}')
      sv=$(printf %s "$svs" | sk -p 'Choose a service: ')
      [ -z "$sv" ] && exit 1
      journalctl -feu "$sv"
    '';
    executable = true;
  };
}
