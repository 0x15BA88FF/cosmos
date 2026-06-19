{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.opencode.enable = lib.mkEnableOption "Enable opencode";

  config = lib.mkIf config.modules.home.opencode.enable {
    home.packages = [ pkgs.opencode ];
  };
}
