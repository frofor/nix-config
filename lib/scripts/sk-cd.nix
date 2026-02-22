{ pkgs, ... }:

pkgs.writeShellScript "sk-cd.sh" ''
  #!/bin/sh
  set -e
  prj="$(find "$XDG_DOCUMENTS_DIR/projects" -mindepth 1 -maxdepth 1 -type d)"
  src="$(find "$HOME/.local/src" -mindepth 1 -maxdepth 1 -type d)"
  dir="$(printf '%s\n%s\n' "$prj" "$src" | sed /^$/d | sort | sk -p 'Choose a directory: ')"
  swaymsg "exec footclient -D '$dir'"
''
