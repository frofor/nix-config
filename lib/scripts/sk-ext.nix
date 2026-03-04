{ pkgs, ... }:

pkgs.writeShellScript "sk-ext.sh" ''
  #!/bin/sh
  while [ $# -gt 0 ]; do
      case "$1" in
          -f) fmt="$2"; shift 2 ;;
          --) shift; break ;;
          *) shift ;;
      esac
  done

  data=$(cat)
  [ -n "$fmt" ] && formatted=$(printf '%s\n' "$data" | eval "$fmt")

  sel=$(printf '%s\n' "''${formatted:-$data}" | sk "$@")
  idx=$(printf '%s\n' "''${formatted:-$data}" | grep -n "^$sel$" | cut -d: -f1)
  printf '%s\n' "$data" | sed -n "''${idx}p"
''
