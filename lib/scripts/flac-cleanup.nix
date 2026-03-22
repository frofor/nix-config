{ pkgs, ... }:

pkgs.writeShellScriptBin "flac-cleanup" ''
  #!/bin/sh
  for f in "$@"; do
      tags=$(${pkgs.flac}/bin/metaflac --export-tags-to - "$f" | sort | awk -F= '!seen[$1]++')
      ${pkgs.flac}/bin/metaflac --remove-all-tags "$f"
      printf '%s\n' "$tags" | ${pkgs.flac}/bin/metaflac --import-tags-from - "$f"
      ${pkgs.flac}/bin/metaflac --dont-use-padding --remove --block-type PADDING "$f"
  done
''
