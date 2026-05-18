{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.home.discord.enable = lib.mkEnableOption "Enable discord";

  config = lib.mkIf config.modules.home.discord.enable {
    home.packages = [ pkgs.discord ];
  };
}
