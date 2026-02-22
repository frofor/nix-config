{ pkgs, ... }:

pkgs.writeShellScript "sk-pass.sh" ''
  #!/bin/sh
  set -e

  entry="$(find "$PASSWORD_STORE_DIR" -type f -name '*.gpg' -printf '%P\n' \
      | sed s/\.gpg$// \
      | sort -V \
      | sk -p 'Choose an entry: ')"

  case "$entry" in
      *-otp)
          attr=OTP
          pass=$(pass otp "$entry")
      ;;
      *)
          attrs="Password: $(pass show "$entry")"
          if [ $(printf '%s\n' "$attrs" | wc -l) -gt 1 ]; then
              attr="$(printf '%s\n' "$attrs" \
                  | awk -F : '{print $1}' \
                  | sort -V \
                  | sk -p 'Choose an attribute: ')"
          else
              attr="$(printf '%s\n' "$attrs" | awk -F : '{print $1}')"
          fi
          pass="$(printf '%s\n' "$attrs" | grep "^$attr:" | sed 's/^[^:]*: *//')"
      ;;
  esac

  wl-copy "$pass"
  ${pkgs.libnotify}/bin/notify-send "Copied $entry#$attr to clipboard"
''
