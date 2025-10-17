{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.desktop.applications.zoom-us.enable = lib.mkEnableOption "Enable zoom-us";

  config = lib.mkIf config.modules.desktop.applications.zoom-us.enable {
    home.packages = [ pkgs.zoom-us ];
  };
}
