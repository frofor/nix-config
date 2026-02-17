{ myLib, ... }:

myLib.mkScript "sk-cd.sh" ''
  proj="$(find "$XDG_DOCUMENTS_DIR/projects" -mindepth 1 -maxdepth 1 -type d -print)"
  src="$(find "$HOME/.local/src" -mindepth 1 -maxdepth 1 -type d -print)"
  dir="$(echo "$proj\n$src" | sed '/^$/d' | sk -p 'Choose a directory: ')"
  [ -z "$dir" ] && exit 1
  swaymsg "exec footclient -D '$dir'"
''
