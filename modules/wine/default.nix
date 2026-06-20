{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.wine.enable = lib.mkEnableOption "Enable wine";

  config = lib.mkIf config.modules.home.wine.enable {
    home.packages = [ pkgs.wineWow64Packages.waylandFull ];
  };
}
