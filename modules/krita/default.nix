{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.krita.enable = lib.mkEnableOption "Enable krita";

  config = lib.mkIf config.modules.home.krita.enable {
    home.packages = [ pkgs.krita ];
  };
}
