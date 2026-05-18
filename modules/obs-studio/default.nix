{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.obs-studio.enable = lib.mkEnableOption "Enable OBS studio";

  config = lib.mkIf config.modules.home.obs-studio.enable {
    programs.obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.wlrobs ];
    };
  };
}
