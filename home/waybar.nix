{ font }:

let
  color = {
    white = "#eceff4";
    dark = "#3b4252";
    black = "#151515";
    red = "#bf616a";
    green = "#a3be8c";
    blue = "#5e81ac";
  };
in
{
  enable = true;
  settings = [{
    spacing = 30;
    modules-left = [
      "sway/workspaces"
      "sway/scratchpad"
      "sway/mode"
      "sway/window"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "keyboard-state"
      "backlight"
      "pulseaudio"
      "battery"
    ];
    "sway/workspaces" = {
      all-outputs = true;
      warp-on-scroll = false;
    };
    "sway/scratchpad" = {
      format = "{icon} {count}";
      format-icons = ["" ""];
    };
    clock.format = "󱑎 {:%R 󰃭 %d.%m}";
    backlight.format = " {percent}%";
    pulseaudio = {
      format = "{icon} {volume}% {format_source}";
      format-muted = "<span color=\"${color.red}\">󰖁</span> {format_source}";
      format-source = " {volume}%";
      format-source-muted = "<span color=\"${color.red}\"></span>";
      format-icons = {
        default = ["󰕿" "󰖀" "󰕾"];
        headphone = "󰋋";
        headset = "󰋎";
      };
    };
    battery = {
      states = {
        warning = 50;
        critical = 30;
      };
      format = "{icon} {capacity}%";
      format-plugged = "󰂄 {capacity}%";
      format-icons = ["󱉞" "󰂎" "󱊡" "󱊢" "󱊣"];
    };
  }];
  style = ''
    * {
      font-family: ${font}, sans-serif;
      font-size: 14px;
    }

    #waybar {
      background-color: ${color.black};
      color: ${color.white};
    }

    .modules-right {
      margin-right: 10px;
    }

    #workspaces button {
      border-radius: 0;
      color: ${color.white};
      padding: 2px 7px;
    }

    #workspaces button.focused {
      background-color: ${color.dark};
    }

    #workspaces button.urgent {
      background-color: ${color.red};
    }

    #mode {
      background-color: ${color.dark};
    }

    #battery {
      color: ${color.green};
    }

    tooltip {
      background-color: ${color.black};
      border-color: ${color.dark};
      border-radius: 0;
    }
  '';
}
