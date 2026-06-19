{
  pkgs,
  lib,
  config,
  ...
}:

let
  keys = {
    mod = "SUPER";
    submod = "ALT";
  };

  app = {
    bar = "waybar";
    browser = "helium";
    terminal = "ghostty";
    filemanager = "nautilus";

    rbw = "rofi-rbw";
    calc = "rofi -show calc";
    emoji = "rofi -show emoji";
    launcher = "rofi -show drun";
    powermenu = "rofi -show power";
    windowmenu = "rofi -show window";
    clipboard = "clipcat-menu insert";
    rmclipboard = "clipcat-menu remove";
    screencapture = "flameshot launcher";
    notifications = "swaync-client --open-panel";
    annotate = "flameshot gui --region 1920x1080+0+0";
  };

in
{
  options.modules.home.hyprland.enable = lib.mkEnableOption "Enable Hyprland";

  config = lib.mkIf config.modules.home.hyprland.enable {
    home.packages = with pkgs; [
      wtype
      pavucontrol
      wl-clipboard
      brightnessctl

      hyprpaper
      hypridle
      hyprlock
      playerctl
      # wpctl
    ];

    ## ─────────────────────────────────────────────
    ## HYPRLAND CONFIG
    ## ─────────────────────────────────────────────
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        # exec-once = [
        #   app.bar
        #   app.browser
        #   app.terminal
        # ];

        # ── General look ──
        general = {
          gaps_in = 4;
          border_size = 2;
        };

        # ── Input ──
        input = {
          touchpad = {
            natural_scroll = true;
            tap-to-click = true;
            accel_profile = "flat";
            sensitivity = 0.2;
          };
        };

        # ── Keybindings ──
        bind = [

          # launchers
          "${keys.mod}, RETURN, exec, ${app.terminal}"
          "${keys.mod}, SPACE, exec, ${app.launcher}"
          "${keys.mod}, PERIOD, exec, ${app.emoji}"
          "${keys.mod}, PLUS, exec, ${app.calc}"
          "${keys.mod}, W, exec, ${app.windowmenu}"
          "${keys.mod}, V, exec, ${app.clipboard}"
          "${keys.mod} SHIFT, V, exec, ${app.rmclipboard}"
          "${keys.mod}, N, exec, ${app.notifications}"
          "${keys.mod}, PRINT, exec, ${app.screencapture}"

          # system
          "${keys.mod}, Q, killactive"
          "${keys.mod}, F, fullscreen"

          # power / exit
          "${keys.mod}, ESCAPE, exit"
          "${keys.mod}, DELETE, exec, ${app.powermenu}"

          # focus movement
          "${keys.mod}, H, movefocus, l"
          "${keys.mod}, L, movefocus, r"
          "${keys.mod}, K, movefocus, u"
          "${keys.mod}, J, movefocus, d"

          # window movement
          "${keys.mod} CTRL, H, movewindow, l"
          "${keys.mod} CTRL, L, movewindow, r"
          "${keys.mod} CTRL, K, movewindow, u"
          "${keys.mod} CTRL, J, movewindow, d"

          # resize
          "${keys.mod} SHIFT CTRL, H, resizeactive, -10 0"
          "${keys.mod} SHIFT CTRL, L, resizeactive, 10 0"
          "${keys.mod} SHIFT CTRL, K, resizeactive, 0 -10"
          "${keys.mod} SHIFT CTRL, J, resizeactive, 0 10"

          # workspaces
          "${keys.mod}, 1, workspace, 1"
          "${keys.mod}, 2, workspace, 2"
          "${keys.mod}, 3, workspace, 3"
          "${keys.mod}, 4, workspace, 4"
          "${keys.mod}, 5, workspace, 5"
          "${keys.mod}, 6, workspace, 6"
          "${keys.mod}, 7, workspace, 7"
          "${keys.mod}, 8, workspace, 8"
          "${keys.mod}, 9, workspace, 9"
          "${keys.mod}, 0, workspace, 10"

          "${keys.mod} SHIFT, 1, movetoworkspace, 1"
          "${keys.mod} SHIFT, 2, movetoworkspace, 2"
          "${keys.mod} SHIFT, 3, movetoworkspace, 3"
          "${keys.mod} SHIFT, 4, movetoworkspace, 4"
          "${keys.mod} SHIFT, 5, movetoworkspace, 5"
          "${keys.mod} SHIFT, 6, movetoworkspace, 6"
          "${keys.mod} SHIFT, 7, movetoworkspace, 7"
          "${keys.mod} SHIFT, 8, movetoworkspace, 8"
          "${keys.mod} SHIFT, 9, movetoworkspace, 9"
          "${keys.mod} SHIFT, 0, movetoworkspace, 10"

          # media keys
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
          ", XF86AudioPlay, exec, playerctl play-pause"

          ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];

        # ── Window rules (Sway assigns equivalent) ──
        windowrulev2 = [
          "workspace 1, class:^(ghostty|alacritty)$"
          "workspace 2, class:^(brave|helium)$"
          "workspace 6, class:^(discord)$"
          "workspace 10, class:^(com.obsproject.Studio)$"
        ];
      };
    };

    ## ─────────────────────────────────────────────
    ## HYPRLOCK (replacement for swaylock)
    ## ─────────────────────────────────────────────
    programs.hyprlock.enable = true;

    ## ─────────────────────────────────────────────
    ## HYPRIDLE (replacement for swayidle)
    ## ─────────────────────────────────────────────
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "hyprctl dispatch dpms off";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "hyprlock";
          }
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };

    ## ─────────────────────────────────────────────
    ## HYPRPAPER (wallpaper manager)
    ## ─────────────────────────────────────────────
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ ];
        wallpaper = [ ];
      };
    };
  };
}
