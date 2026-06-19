{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.audacity.enable = lib.mkEnableOption "Enable audacity";

  config = lib.mkIf config.modules.home.audacity.enable {
    home.packages = [ pkgs.audacity ];
  };
}
