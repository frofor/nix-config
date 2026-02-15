{ myLib, ... }:

myLib.mkScriptLocalBin "vwhich" ''
  "$VISUAL" "$(which "$1")"
''
