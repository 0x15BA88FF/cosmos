{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.antigravity.enable = lib.mkEnableOption "Enable antigravity";

  config = lib.mkIf config.modules.home.antigravity.enable {
    home.packages = [ pkgs.antigravity-ide ];
  };
}
