{ pkgs, myLib, ... }:

myLib.mkScript "sk-pass.sh" ''
  entry="$(find "$HOME/.password-store" -type f -name '*.gpg' -printf '%P\n' \
      | sed s/\.gpg$// \
      | sk -p 'Choose an entry: ')" || exit 1

  case "$entry" in
      *-otp)
          attr=OTP
          pass=$(pass otp "$entry") || exit 1
      ;;
      *)
          attrs="Password: $(pass show "$entry")" || exit 1
          if [ $(echo "$attrs" | wc -l) -gt 1 ]; then
              attr="$(echo "$attrs" | awk -F : '{print $1}' | sk -p 'Choose an attribute: ')" \
                  || exit 1
          else
              attr="$(echo "$attrs" | awk -F : '{print $1}')"
          fi
          pass="$(echo "$attrs" | grep "^$attr:" | sed 's/^[^:]*: *//')"
      ;;
  esac

  wl-copy "$pass"
  echo "Copied \033[33m$entry#$attr\033[0m to clipboard"
  '${pkgs.libnotify}/bin/notify-send' "Copied $entry#$attr to clipboard"
''
