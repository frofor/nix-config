{ pkgs, uuid, ... }:

pkgs.writeShellScriptBin "luks-close" ''
  #!/bin/sh
  doas umount /dev/mapper/luks-${uuid} || exit 1
  doas cryptsetup close /dev/mapper/luks-${uuid} || exit 1
  ${pkgs.libnotify}/bin/notify-send '${uuid} unmounted and closed'
''
