{ myLib, ... }:

myLib.mkScriptLocalBin "pkg" ''
  nix shell nixpkgs#"$1" -c "$SHELL"
''
