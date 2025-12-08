{ font }:

let
  color = {
    black = "#000000";
    white = "#ffffff";
    red = "#ff0000";
    orange = "#ff5a00";
    yellow = "#ffff00";
    green = "#00ff00";
    blue = "#0000ff";
  };
in
{
  programs.waybar = {
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
        format = "{icon}";
        format-icons = {
          "1" = "󰋜";
          "2" = "󰈹";
          "3" = "󰌆";
          urgent = "";
        };
        tooltip = false;
      };
      "sway/scratchpad" = {
        format = "{icon} {count}";
        format-icons = [ "" "" ];
        tooltip = false;
      };
      "sway/mode" = {
        format = "<span text-transform=\"uppercase\">-- {} --</span>";
        tooltip = false;
      };
      "sway/window".tooltip = false;
      clock = {
        format = "󱑎 {:%R 󰃭 %d.%m}";
        tooltip = false;
      };
      backlight = {
        format = " {percent}%";
        tooltip = false;
      };
      pulseaudio = {
        on-scroll-up = "";
        on-scroll-down = "";
        format = "{icon} {volume}% {format_source}";
        format-muted = "<span color=\"${color.red}\">󰖁</span> {format_source}";
        format-source = " {volume}%";
        format-source-muted = "<span color=\"${color.red}\"></span>";
        format-icons = {
          default = [ "󰕿" "󰖀" "󰕾" ];
          headphone = "󰋋";
          headset = "󰋎";
        };
        tooltip = false;
      };
      battery = {
        states = {
          high = 100;
          medium = 60;
          low = 40;
          critical = 20;
        };
        format = "{icon}  {capacity}%";
        format-charging = "{icon}󱐋 {capacity}%";
        format-discharging = "{icon}󰚥 {capacity}%";
        format-icons = {
          high = "󱊣";
          medium = "󱊢";
          low = "󱊡";
          critical = "󰂎";
        };
        tooltip = false;
      };
    }];
    style = ''
      * {
          font-family: ${font}, sans-serif;
          font-size: 12px;
      }

      #waybar {
          background-color: ${color.black};
          color: ${color.white};
      }

      .modules-right {
          margin-right: 10px;
      }

      #workspaces button {
          border: none;
          border-radius: 0;
          color: ${color.white};
          padding: 0px 4px;
          transition: initial;
      }

      #workspaces button:hover {
          background: initial;
          box-shadow: initial;
          text-shadow: initial;
      }

      #workspaces button.focused {
          background-color: ${color.white};
          color: ${color.black};
      }

      #workspaces button.urgent {
          background-color: ${color.red};
      }

      #mode {
          background-color: inherit;
          color: inherit;
      }

      #battery.high {
          color: ${color.green};
      }

      #battery.medium {
          color: ${color.yellow};
      }

      #battery.low {
          color: ${color.orange};
      }

      #battery.critical {
          color: ${color.red};
      }

      #battery.charging {
          color: ${color.blue};
      }
    '';
  };
}
