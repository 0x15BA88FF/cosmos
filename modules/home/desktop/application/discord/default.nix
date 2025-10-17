{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.desktop.applications.discord.enable = lib.mkEnableOption "Enable discord";

  config = lib.mkIf config.modules.desktop.applications.discord.enable {
    home.packages = [ pkgs.discord ];
  };
}
