{ pkgs, uuid, passEntry, ... }:

pkgs.writeShellScriptBin "luks-open" ''
  #!/bin/sh
  pass=$(pass '${passEntry}') || exit 1
  printf %s "$pass" \
      | doas cryptsetup open --key-file=- /dev/disk/by-uuid/${uuid} luks-${uuid} \
      || exit 1
  doas mkdir -p /mnt/${uuid}
  doas mount /dev/mapper/luks-${uuid} /mnt/${uuid} || exit 1
  ${pkgs.libnotify}/bin/notify-send '${uuid} opened and mounted'
''
