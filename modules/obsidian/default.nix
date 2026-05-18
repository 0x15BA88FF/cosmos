{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.obsidian.enable = lib.mkEnableOption "Enable obsidian";

  config = lib.mkIf config.modules.home.obsidian.enable {
    home.packages = [ pkgs.obsidian ];
  };
}
