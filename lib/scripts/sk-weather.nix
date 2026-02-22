{ pkgs, skExt, latitude, longitude, ... }:

pkgs.writeShellScript "sk-weather.sh" ''
  #!/bin/sh
  set -e

  days=$(seq 0 6 | ${skExt} -f "xargs -I {} date -d '{} days' +%d.%m" -- -p 'Choose a date: ')
  date=$(date -d "$days days" +%Y-%m-%d)

  url=https://api.open-meteo.com/v1/forecast
  url="$url?latitude=${latitude}"
  url="$url&longitude=${longitude}"
  url="$url&hourly=temperature_2m"
  url="$url&timezone=$(timedatectl show -p Timezone --value)"
  url="$url&start_date=$date"
  url="$url&end_date=$date"

  temp=$(curl -s "$url" \
      | ${pkgs.jq}/bin/jq -r '
          [ .hourly.time, .hourly.temperature_2m ]
          | transpose[]
          | "\(.[0] | strptime("%Y-%m-%dT%H:%M") | strftime("%H:%M")): "
              + "\(.[1] | tostring | " " * (4 - length) + .) °C"' \
      | sk -p 'Choose a time: ' \
      | awk '{print $2, $3}')

  wl-copy "$temp"
  ${pkgs.libnotify}/bin/notify-send "Temperature copied to clipboard" "$temp"
''
