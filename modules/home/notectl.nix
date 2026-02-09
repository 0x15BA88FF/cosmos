{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.home.notectl.enable = lib.mkEnableOption "Enable notectl";

  config = lib.mkIf config.modules.home.notectl.enable {
    home.packages = [ pkgs.notectl ];
  };
}
