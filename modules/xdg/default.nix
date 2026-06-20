{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.xdg.enable = lib.mkEnableOption "Enable xdg";

  config = lib.mkIf config.modules.home.xdg.enable {
    xdg.portal = {
      enable = true;
      config.common.default = lib.mkDefault "wlr";
      extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    };
  };
}
