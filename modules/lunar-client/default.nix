{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.lunar-client.enable = lib.mkEnableOption "Enable lunar-client";

  config = lib.mkIf config.modules.home.lunar-client.enable {
    home.packages = [ pkgs.lunar-client ];
  };
}
