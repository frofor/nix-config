{ pkgs, ... }:

pkgs.writeShellScript "sk-cd.sh" ''
  #!/bin/sh
  prj="$(find "$XDG_DOCUMENTS_DIR/projects" -mindepth 1 -maxdepth 1 -type d)"
  src="$(find "$HOME/.local/src" -mindepth 1 -maxdepth 1 -type d)"
  dir="$(printf '%s\n%s' "$prj" "$src" | sed /^$/d | sort | sk -p 'Choose a directory: ')" || exit 1
  swaymsg "exec footclient -D '$dir'"
''
