{
  pkgs,
  lib,
  config,
  ...
}:
let
  keys = {
    mod = "Mod4";
    submod = "Mod1";
  };
  app = {
    browser = "brave";
    terminal = "alacritty";
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
  options.modules.home.sway.enable = lib.mkEnableOption "Enable sway";

  config = lib.mkIf config.modules.home.sway.enable {
    xdg.portal = {
      enable = true;
      config.common.default = [ "wlr" ];
      extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    };

    programs.swaylock.enable = true;

    home.packages = [
      pkgs.wtype
      pkgs.pavucontrol
      pkgs.wl-clipboard
      pkgs.brightnessctl
    ];

    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = {
        terminal = app.terminal;
        startup = [
          { command = app.terminal; }
          { command = app.browser; }
        ];
        assigns = {
          "1" = [
            { app_id = "Alacritty"; }
          ];
          "2" = [
            { app_id = "brave"; }
          ];
          "3" = [
            { app_id = "nautilus"; }
          ];
          "6" = [
            { class = "discord"; }
          ];
          "10" = [
            { app_id = "com.obsproject.Studio"; }
          ];
        };
        gaps.inner = 4;
        bars = [ ];
        window = {
          border = 0;
          titlebar = false;
        };
        floating = {
          titlebar = false;
          modifier = keys.mod;
        };
        keybindings = {
          "${keys.mod}+b" = "exec ${app.browser}";
          "${keys.mod}+e" = "exec ${app.filemanager}";
          "${keys.mod}+Return" = "exec ${app.terminal}";

          "${keys.mod}+Plus" = "exec ${app.calc}";
          "${keys.mod}+a" = "exec ${app.annotate}";
          "${keys.mod}+v" = "exec ${app.clipboard}";
          "${keys.mod}+Shift+v" = "exec ${app.rmclipboard}";
          "${keys.mod}+Period" = "exec ${app.emoji}";
          "${keys.mod}+Underscore" = "exec ${app.rbw}";
          "${keys.mod}+Space" = "exec ${app.launcher}";
          "${keys.mod}+w" = "exec ${app.windowmenu}";
          "${keys.mod}+n" = "exec ${app.notifications}";
          "Print" = "exec ${app.screencapture}";

          "${keys.mod}+q" = "kill";
          "${keys.mod}+r" = "reload";
          "${keys.mod}+Escape" = "exec sway exit";
          "${keys.mod}+Delete" = "exec ${app.powermenu}";

          "${keys.mod}+f" = "fullscreen toggle";
          "${keys.mod}+Control+c" = "move position center";
          "${keys.mod}+Control+f" = "floating toggle, move position center";

          "${keys.mod}+h" = "focus left";
          "${keys.mod}+j" = "focus down";
          "${keys.mod}+k" = "focus up";
          "${keys.mod}+l" = "focus right";

          "${keys.mod}+Control+h" = "move left";
          "${keys.mod}+Control+j" = "move down";
          "${keys.mod}+Control+k" = "move up";
          "${keys.mod}+Control+l" = "move right";

          "${keys.mod}+${keys.submod}+slash" = "layout toggle split";

          "${keys.mod}+Shift+Control+h" = "resize grow width 10 px or 10 ppt";
          "${keys.mod}+Shift+Control+j" = "resize shrink height 10 px or 10 ppt";
          "${keys.mod}+Shift+Control+k" = "resize grow height 10 px or 10 ppt";
          "${keys.mod}+Shift+Control+l" = "resize shrink width 10 px or 10 ppt";

          "${keys.mod}+1" = "workspace number 1";
          "${keys.mod}+2" = "workspace number 2";
          "${keys.mod}+3" = "workspace number 3";
          "${keys.mod}+4" = "workspace number 4";
          "${keys.mod}+5" = "workspace number 5";
          "${keys.mod}+6" = "workspace number 6";
          "${keys.mod}+7" = "workspace number 7";
          "${keys.mod}+8" = "workspace number 8";
          "${keys.mod}+9" = "workspace number 9";
          "${keys.mod}+0" = "workspace number 10";

          "${keys.mod}+Shift+1" = "move container to workspace number 1";
          "${keys.mod}+Shift+2" = "move container to workspace number 2";
          "${keys.mod}+Shift+3" = "move container to workspace number 3";
          "${keys.mod}+Shift+4" = "move container to workspace number 4";
          "${keys.mod}+Shift+5" = "move container to workspace number 5";
          "${keys.mod}+Shift+6" = "move container to workspace number 6";
          "${keys.mod}+Shift+7" = "move container to workspace number 7";
          "${keys.mod}+Shift+8" = "move container to workspace number 8";
          "${keys.mod}+Shift+9" = "move container to workspace number 9";
          "${keys.mod}+Shift+0" = "move container to workspace number 10";

          "XF86MonBrightnessUp" = "exec brightnessctl s 10%+";
          "XF86MonBrightnessDown" = "exec brightnessctl s 10%-";

          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "Shift+XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "Shift+XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+";
          "Shift+XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-";

          "XF86AudioPlay" = "exec playerctl play";
          "XF86AudioStop" = "exec playerctl stop";
          "XF86AudioPause" = "exec playerctl pause";
          "XF86AudioMedia" = "exec playerctl play-pause";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioPrev" = "exec playerctl previous";
        };
      };
    };

    services.swayidle =
      let
        lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
        display = status: "swaymsg 'output * power ${status}'";
      in
      {
        enable = true;
        timeouts = [
          {
            timeout = 300;
            command = lock;
          }
          {
            timeout = 330;
            command = display "off";
            resumeCommand = display "on";
          }
          {
            timeout = 360;
            command = "${pkgs.systemd}/bin/systemctl suspend";
          }
        ];
        events = [
          {
            event = "before-sleep";
            command = (display "off") + "; " + lock;
          }
          {
            event = "after-resume";
            command = display "on";
          }
          {
            event = "lock";
            command = (display "off") + "; " + lock;
          }
          {
            event = "unlock";
            command = display "on";
          }
        ];
      };
  };
}
