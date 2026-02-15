{ pkgs, myLib, ... }:

myLib.mkScriptLocalBin "def" ''
  '${pkgs.dict}/bin/dict' -h dict.org "$1" | less
''
