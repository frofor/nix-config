{ pkgs, myLib, ... }:

myLib.mkScriptLocalBin "sk-attr" ''
  attrs=$(sed 1d)
  attr=$(echo "$attrs" | awk -F : '{print $1}' | sk -p 'Choose an attribute: ')
  [ -z "$attr" ] && exit 1

  wl-copy $(echo "$attrs" | grep "^$attr:" | sed 's/^[^:]*: *//')
  echo "Copied \033[33m$attr\033[0m to clipboard"
  '${pkgs.libnotify}/bin/notify-send' "Copied $attr to clipboard"
''
