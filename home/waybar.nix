{ font, colors, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      spacing = 30;
      modules-left = [ "sway/workspaces" "sway/scratchpad" "sway/mode" "sway/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "backlight" "pulseaudio" "sway/language" "battery" ];
      "sway/workspaces" = {
        all-outputs = true;
        warp-on-scroll = false;
        format = "{icon}";
        format-icons = {
          "1" = "󰋜";
          "2" = "󰈹";
          "3" = "";
          "4" = "";
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
      network = {
        format-ethernet = " {ifname}";
        format-wifi = "󰖩 {essid}";
        format-linked = "󰌹 {ifname}";
        format-disconnected = "󰖪";
        format-disabled = "󰲛";
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
        format-muted = "<span color=\"#${colors.red}\">󰖁</span> {format_source}";
        format-source = " {volume}%";
        format-source-muted = "<span color=\"#${colors.red}\"></span>";
        format-icons = {
          default = [ "󰕿" "󰖀" "󰕾" ];
          headphone = "󰋋";
          headset = "󰋎";
        };
        tooltip = false;
      };
      "sway/language" = {
        format = "󰇧 {}";
        tooltip = false;
      };
      battery = {
        states = {
          high = 100;
          medium = 60;
          low = 40;
          critical = 20;
        };
        format = "{icon}󱐋 {capacity}%";
        format-discharging = "{icon}  {capacity}%";
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
          background-color: #${colors.black};
          color: #${colors.white};
      }

      .modules-right {
          margin-right: 10px;
      }

      #workspaces button {
          border: none;
          border-radius: 0;
          color: #${colors.orange};
          padding: 0px 4px;
          transition: initial;
      }

      #workspaces button:hover {
          background: initial;
          box-shadow: initial;
          text-shadow: initial;
      }

      #workspaces button.focused {
          background-color: #${colors.orange};
          color: #${colors.black};
      }

      #workspaces button.urgent {
          background-color: #${colors.red};
      }

      #mode {
          background-color: inherit;
          color: inherit;
      }

      #network.disconnected, #network.disabled {
          color: #${colors.red};
      }

      #battery {
          color: #${colors.green};
      }

      #battery.discharging {
          color: #${colors.white};
      }

      #battery.discharging.medium {
          color: #${colors.yellow};
      }

      #battery.discharging.low {
          color: #${colors.orange};
      }

      #battery.discharging.critical {
          color: #${colors.red};
      }
    '';
  };
}
