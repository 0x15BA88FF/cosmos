{ lib, config, ... }:
{
  options.modules.home.mangohud.enable = lib.mkEnableOption "Enable mangohud";

  config = lib.mkIf config.modules.home.mangohud.enable {
    programs.mangohud.enable = true;
  };
}
