{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.home.gimp.enable = lib.mkEnableOption "Enable gimp";

  config = lib.mkIf config.modules.home.gimp.enable {
    home.packages = [ pkgs.gimp ];
  };
}
