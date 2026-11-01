{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.flatpak.enable = lib.mkEnableOption "Enable flatpak";

  config = lib.mkIf config.modules.home.flatpak.enable {
    home.packages = [ pkgs.flatpak ];
  };
}
