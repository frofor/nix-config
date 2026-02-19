{ pkgs, ... }:

pkgs.writeShellScript "sk-pass.sh" ''
  #!/bin/sh
  entry="$(find "$PASSWORD_STORE_DIR" -type f -name '*.gpg' -printf '%P\n' \
      | sed s/\.gpg$// \
      | sk -p 'Choose an entry: ')" || exit 1

  case "$entry" in
      *-otp)
          attr=OTP
          pass=$(pass otp "$entry") || exit 1
      ;;
      *)
          attrs="Password: $(pass show "$entry")" || exit 1
          if [ $(printf "$attrs" | wc -l) -gt 1 ]; then
              attr="$(printf "$attrs" | awk -F : '{print $1}' | sk -p 'Choose an attribute: ')" \
                  || exit 1
          else
              attr="$(printf "$attrs" | awk -F : '{print $1}')"
          fi
          pass="$(printf "$attrs" | grep "^$attr:" | sed 's/^[^:]*: *//')"
      ;;
  esac

  wl-copy "$pass"
  '${pkgs.libnotify}/bin/notify-send' "Copied $entry#$attr to clipboard"
''
