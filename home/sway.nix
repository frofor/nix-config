{ font }:

let
  mod = "Mod4";
  left = "h";
  right = "l";
  up = "k";
  down = "j";
in
{
  enable = true;
  config = {
    modifier = mod;
    assigns = {
      "2" = [{ app_id = "librewolf"; }];
      "3" = [{ app_id = "org.keepassxc.KeePassXC"; }];
      "4" = [{ app_id = "mpv"; }];
      "5" = [{ app_id = "gimp"; }];
    };
    startup = [
      { command = "librewolf"; }
      { command = "keepassxc"; }
      { command = "mpv \"$XDG_MUSIC_DIR\""; }
    ];
    keybindings = {
      "${mod}+return" = "exec foot";
      "${mod}+b" = "exec librewolf";
      "${mod}+p" = "exec keepassxc";
      "${mod}+n" = "exec foot -e nmtui-connect";
      "${mod}+f" = "fullscreen";
      "${mod}+x" = "kill";
      "${mod}+${left}" = "focus left";
      "${mod}+${right}" = "focus right";
      "${mod}+${up}" = "focus up";
      "${mod}+${down}" = "focus down";
      "${mod}+shift+${left}" = "move left";
      "${mod}+shift+${right}" = "move right";
      "${mod}+shift+${up}" = "move up";
      "${mod}+shift+${down}" = "move down";
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
      "${mod}+shift+space" = "floating toggle";
      "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
      "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
      "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "XF86AudioPlay" = "exec echo cycle pause | socat - \"$XDG_RUNTIME_DIR\"/mpv.sock";
      "XF86AudioPause" = "exec echo cycle pause | socat - \"$XDG_RUNTIME_DIR\"/mpv.sock";
      "XF86AudioStop" = "exec echo cycle pause | socat - \"$XDG_RUNTIME_DIR\"/mpv.sock";
      "XF86AudioPrev" = "exec echo playlist-prev | socat - \"$XDG_RUNTIME_DIR\"/mpv.sock";
      "XF86AudioNext" = "exec echo playlist-next | socat - \"$XDG_RUNTIME_DIR\"/mpv.sock";
      "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
      "XF86MonBrightnessUp" = "exec brightnessctl s +5%";
    };
    bars = [{ command = "waybar"; }];
    window = {
      titlebar = false;
      border = 1;
    };
    fonts = {
      names = [font];
      style = "Regular";
      size = 10.0;
    };
  };
}
