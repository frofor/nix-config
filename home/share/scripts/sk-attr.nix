{ config, ... }:

{
  home.file."${config.home.homeDirectory}/.local/bin/sk-attr" = {
    text = ''
      #!/bin/sh
      attrs=$(sed 1d)
      attr=$(printf '%s' "$attrs" | awk -F : '{print $1}' | sk -p 'Choose an attribute: ')
      [ -z "$attr" ] && exit 1

      wl-copy $(printf %s "$attrs" | grep "^$attr:" | sed 's/^[^:]*: *//')
      echo "Copied \033[33m$attr\033[0m to clipboard"
      notify-send "Copied $attr to clipboard"
    '';
    executable = true;
  };
}
