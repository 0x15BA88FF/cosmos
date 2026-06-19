{ lib, config, ... }:
{
  options.modules.home.waybar.enable = lib.mkEnableOption "Enable waybar";

  config = lib.mkIf config.modules.home.waybar.enable {
    programs.waybar = {
      enable = true;
    };
  };
}
