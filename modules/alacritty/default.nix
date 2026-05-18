{ config, lib, ... }:
{
  options.modules.home.alacritty.enable = lib.mkEnableOption "Enable alacritty";

  config = lib.mkIf config.modules.home.alacritty.enable {
    programs.alacritty.enable = true;
  };
}
