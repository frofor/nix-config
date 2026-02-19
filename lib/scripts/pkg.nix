{ pkgs, ... }:

pkgs.writeShellScriptBin "pkg" ''
  #!/bin/sh
  if [ -z "$1" ]; then
      echo 'Usage: pkg <PACKAGE>'
      echo 'Run a shell with the package installed'
      exit 1
  fi
  nix shell nixpkgs#"$1" -c "$SHELL"
''
