{ config, lib, ... }:
{
  options.modules.desktop.applications.chromium.enable = lib.mkEnableOption "Enable chromium";

  config = lib.mkIf config.modules.desktop.applications.chromium.enable {
    programs.chromium.enable = true;
  };
}
