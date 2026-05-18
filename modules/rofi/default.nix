{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.rofi.enable = lib.mkEnableOption "Enable rofi";

  config = lib.mkIf config.modules.home.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi;
      plugins = [
        pkgs.rofi-calc
        pkgs.rofi-emoji
        pkgs.rofi-power-menu
      ];
      modes = [
        "drun"
        "calc"
        "emoji"
        "window"
        {
          name = "power";
          path = lib.getExe' pkgs.rofi-power-menu "rofi-power-menu";
        }
      ];

      theme = {
        "window" = {
          border = 4;
          width = 500;
          padding = 0;
          border-color = "@primary";
          children = [
            "inputbar"
            "message"
            "listview"
          ];
        };
        "inputbar" = {
          children = [ "entry" ];
          background-color = "@primary";
        };
        "listview" = {
          lines = 10;
          spacing = 0;
          scrollbar = false;
          fixed-height = true;
        };
        "entry".padding = 8;
        "element".padding = 8;
      };
    };
  };
}
