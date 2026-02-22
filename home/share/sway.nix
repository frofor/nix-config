{ pkgs, myLib, font, ... }:

let
  mod = "mod4";
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = mod;
      input."*" = {
        xkb_layout = "us,de,ru";
        xkb_options = "grp:alt_shift_toggle";
      };
      output = {
        HDMI-A-1.pos = "0 0";
        eDP-1.pos = "1920 0";
      };
      startup = [
        { command = "foot -s"; }
        { command = "librewolf"; }
      ];
      keybindings = {
        "${mod}+return" = "exec footclient";
        "${mod}+f" = "fullscreen";
        "${mod}+a" = "exec footclient -F ${myLib.scripts.skApp}";
        "${mod}+c" = "exec footclient -F ${myLib.scripts.skCd}";
        "${mod}+p" = "exec footclient -F ${myLib.scripts.skPass}";
        "${mod}+s" = "exec footclient -F ${myLib.scripts.skService}";
        "${mod}+u" = "exec footclient -F ${myLib.scripts.skJournal}";
        "${mod}+w" = "exec footclient -F ${myLib.scripts.skWeather}";
        "${mod}+x" = "kill";
        "${mod}+r" = "mode resize";
        "${mod}+h" = "focus left";
        "${mod}+left" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+down" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+up" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+right" = "focus right";
        "${mod}+shift+h" = "move left";
        "${mod}+shift+left" = "move left";
        "${mod}+shift+j" = "move down";
        "${mod}+shift+down" = "move down";
        "${mod}+shift+k" = "move up";
        "${mod}+shift+up" = "move up";
        "${mod}+shift+l" = "move right";
        "${mod}+shift+right" = "move right";
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        "${mod}+tab" = "workspace back_and_forth";
        "${mod}+shift+1" = "move container to workspace number 1";
        "${mod}+shift+2" = "move container to workspace number 2";
        "${mod}+shift+3" = "move container to workspace number 3";
        "${mod}+shift+4" = "move container to workspace number 4";
        "${mod}+shift+5" = "move container to workspace number 5";
        "${mod}+shift+6" = "move container to workspace number 6";
        "${mod}+shift+7" = "move container to workspace number 7";
        "${mod}+shift+8" = "move container to workspace number 8";
        "${mod}+shift+9" = "move container to workspace number 9";
        "${mod}+shift+0" = "move container to workspace number 10";
        "${mod}+minus" = "scratchpad show";
        "${mod}+shift+minus" = "move scratchpad";
        "${mod}+t" = "layout tabbed";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+shift+space" = "floating toggle";
        XF86AudioLowerVolume = "exec wpctl set-volume @DEFAULT_SINK@ 10%-";
        XF86AudioRaiseVolume = "exec wpctl set-volume @DEFAULT_SINK@ 10%+";
        XF86AudioMute = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
        XF86AudioPlay = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        XF86AudioPause = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        XF86AudioStop = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        XF86AudioPrev = "exec ${pkgs.playerctl}/bin/playerctl previous";
        XF86AudioNext = "exec ${pkgs.playerctl}/bin/playerctl next";
        XF86MonBrightnessDown = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 10%-";
        XF86MonBrightnessUp = "exec ${pkgs.brightnessctl}/bin/brightnessctl s +10%";
        Print = "exec ${myLib.scripts.snip}";
      };
      modes.resize = {
        h = "resize shrink width 25 px";
        left = "resize shrink width 25 px";
        j = "resize grow height 25 px";
        down = "resize grow height 25 px";
        k = "resize shrink height 25 px";
        up = "resize shrink height 25 px";
        l = "resize grow width 25 px";
        right = "resize grow width 25 px";
        escape = "mode default";
      };
      fonts = {
        names = [ font ];
        style = "Regular";
        size = 10.0;
      };
      window = {
        titlebar = false;
        border = 1;
      };
      bars = [{ command = "waybar"; }];
      assigns = {
        "2" = [{ app_id = "librewolf"; }];
        "3" = [{ app_id = "mpv"; }];
        "4" = [{ app_id = "gimp"; }];
      };
      workspaceOutputAssign = [
        { workspace = "1"; output = "HDMI-A-1"; }
        { workspace = "2"; output = "HDMI-A-1"; }
        { workspace = "3"; output = "eDP-1"; }
        { workspace = "4"; output = "HDMI-A-1"; }
      ];
    };
  };
}
