{ pkgs, ... }:

pkgs.writeShellScriptBin "def" ''
  #!/bin/sh
  if [ -z "$1" ]; then
      printf '\e[31mUsage:\e[0m def \e[33m<WORD>\e[0m\n'
      printf 'Look up the definition of the word in dict.org\n'
      exit 1
  fi
  ${pkgs.dict}/bin/dict -h dict.org "$1" | less
''
