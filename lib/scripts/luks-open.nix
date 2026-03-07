{ pkgs, uuid, passEntry, ... }:

pkgs.writeShellScriptBin "luks-open" ''
  #!/bin/sh
  printf %s "$(pass '${passEntry}')" \
      | doas cryptsetup open --key-file=- /dev/disk/by-uuid/${uuid} luks-${uuid} \
      && doas mkdir -p /mnt/${uuid} \
      && doas mount /dev/mapper/luks-${uuid} /mnt/${uuid} \
      && ${pkgs.libnotify}/bin/notify-send '${uuid} opened and mounted'
''
