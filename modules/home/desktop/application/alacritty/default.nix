{ config, lib, ... }:
{
  options.modules.desktop.applications.alacritty.enable = lib.mkEnableOption "Enable alacritty";

  config = lib.mkIf config.modules.desktop.applications.alacritty.enable {
    programs.alacritty.enable = true;
  };
}
