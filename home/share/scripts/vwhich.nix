{ myLib, ... }:

myLib.mkScriptLocalBin "vwhich" ''
  which "$1" | xargs "$VISUAL"
''
