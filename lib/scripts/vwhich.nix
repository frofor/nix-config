{ pkgs, ... }:

pkgs.writeShellScriptBin "vwhich" ''
  #!/bin/sh
  set -e

  if [ -z "$1" ]; then
      printf '\e[31mUsage:\e[0m vwhich \e[33m<PROGRAM>\e[0m\n'
      printf "Edit the source code of the program with $VISUAL editor\n"
      exit 1
  fi
  "$VISUAL" "$(which "$1")"
''
