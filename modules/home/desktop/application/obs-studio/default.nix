{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.desktop.applications.obs-studio.enable = lib.mkEnableOption "Enable obs-studio";

  config = lib.mkIf config.modules.desktop.applications.obs-studio.enable {
    programs.obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.wlrobs ];
    };
  };
}
