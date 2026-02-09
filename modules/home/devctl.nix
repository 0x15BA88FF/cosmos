{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.home.devctl.enable = lib.mkEnableOption "Enable devctl";

  config = lib.mkIf config.modules.home.devctl.enable {
    home.packages = [ pkgs.devctl ];
  };
}
