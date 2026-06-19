{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.helium.enable = lib.mkEnableOption "Enable helium";

  config = lib.mkIf config.modules.home.helium.enable {
    home.packages = [ pkgs.helium ];
  };
}
