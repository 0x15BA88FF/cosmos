{ config, lib, ... }:
{
  options.modules.home.direnv.enable = lib.mkEnableOption "Enable direnv";

  config = lib.mkIf config.modules.home.direnv.enable {
    programs.direnv.enable = true;
  };
}
