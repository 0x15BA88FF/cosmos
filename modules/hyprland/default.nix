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

        bind = [
          "${keys.mod}, RETURN, exec, ${app.terminal}"
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

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ ];
        wallpaper = [ ];
      };
    };
  };
}
