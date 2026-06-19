{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.discord.enable = lib.mkEnableOption "Enable discord";

  config = lib.mkIf config.modules.home.discord.enable {
    home.packages = [ pkgs.vesktop ];
  };
}
