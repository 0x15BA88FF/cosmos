{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.easyeffects.enable = lib.mkEnableOption "Enable easyeffects";

  config = lib.mkIf config.modules.home.easyeffects.enable {
    # programs.dconf.enable = true;
    services.easyeffects.enable = true;
    home.packages = [ pkgs.easyeffects ];
  };
}
