{ myLib, ... }:

myLib.mkScript "sk-cd.sh" ''
  prj="$(find "$XDG_DOCUMENTS_DIR/projects" -mindepth 1 -maxdepth 1 -type d)"
  src="$(find "$HOME/.local/src" -mindepth 1 -maxdepth 1 -type d)"
  dir="$(echo "$prj\n$src" | sed /^$/d | sk -p 'Choose a directory: ')" || exit 1
  swaymsg "exec footclient -D '$dir'"
''
