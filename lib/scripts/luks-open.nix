{ pkgs, uuid, ... }:

pkgs.writeShellScriptBin "luks-open" ''
  #!/bin/sh
  printf 'Enter passphrase for ${uuid}: '
  stty -echo
  read pass
  stty echo
  printf '\n'

  printf %s "$pass" \
      | doas cryptsetup open --key-file=- /dev/disk/by-uuid/${uuid} luks-${uuid} \
      && doas mkdir -p /mnt/${uuid} \
      && doas mount /dev/mapper/luks-${uuid} /mnt/${uuid} \
      && ${pkgs.libnotify}/bin/notify-send '${uuid} opened and mounted'
''
