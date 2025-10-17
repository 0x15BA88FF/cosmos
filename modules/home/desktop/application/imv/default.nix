{ config, lib, ... }:
{
  options.modules.desktop.applications.imv.enable = lib.mkEnableOption "Enable imv";

  config = lib.mkIf config.modules.desktop.applications.imv.enable {
    programs.imv.enable = true;
  };
}
