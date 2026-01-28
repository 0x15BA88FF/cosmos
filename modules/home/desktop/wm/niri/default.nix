{ pkgs, ... }:
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
  xdg.portal = {
    enable = true;
    config.common.default = [ "wlr" ];
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };

  home.packages = [
    pkgs.wtype
    pkgs.pavucontrol
    pkgs.wl-clipboard
    pkgs.brightnessctl
    pkgs.xwayland-satellite
  ];

  programs.niri.enable = true;
  programs.swaylock.enable = true;

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
}
