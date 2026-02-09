{ config, lib, ... }:
{
  options.modules.home.imv.enable = lib.mkEnableOption "Enable imv";

  config = lib.mkIf config.modules.home.imv.enable {
    programs.imv.enable = true;
  };
}
