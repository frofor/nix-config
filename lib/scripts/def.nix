{ pkgs, ... }:

pkgs.writeShellScriptBin "def" ''
  #!/bin/sh
  if [ -z "$1" ]; then
      echo 'Usage: def <WORD>'
      echo 'Look up the definition of the word in dict.org'
      exit 1
  fi
  '${pkgs.dict}/bin/dict' -h dict.org "$1" | less
''
