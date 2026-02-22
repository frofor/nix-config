{ pkgs, ... }:

pkgs.writeShellScript "sk-ext.sh" ''
  #!/bin/sh
  set -e

  while [ $# -gt 0 ]; do
      case "$1" in
          -f) format="$2"; shift 2 ;;
          --) shift; break ;;
          *) shift ;;
      esac
  done

  data=$(cat)

  [ -n "$format" ] && pretty_data=$(printf '%s\n' "$data" | eval "$format")

  sel=$(printf '%s\n' "''${pretty_data:-data}" | sk "$@")
  idx=$(printf '%s\n' "''${pretty_data:-data}" | grep -n "^$sel$" | cut -d: -f1)
  printf '%s\n' "$data" | sed -n "''${idx}p"
''
