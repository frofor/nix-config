{ pkgs, ... }:

pkgs.writeShellScriptBin "pkg" ''
  #!/bin/sh
  set -e

  if [ -z "$1" ]; then
      printf '\e[31mUsage:\e[0m pkg \e[33m<PACKAGE>\e[0m\n'
      printf 'Run a shell with the package installed\n'
      exit 1
  fi
  nix shell nixpkgs#"$1" -c "$SHELL"
''
