{ pkgs, ... }:

pkgs.writeShellScriptBin "vwhich" ''
  #!/bin/sh
  if [ -z "$1" ]; then
      echo 'Usage: vwhich <PROGRAM>'
      echo "Edit the source code of the program with $VISUAL editor"
      exit 1
  fi
  "$VISUAL" "$(which "$1")"
''
