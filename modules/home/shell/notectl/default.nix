{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.shell.notectl.enable = lib.mkEnableOption "Enable notectl";

  config = lib.mkIf config.modules.shell.notectl.enable {
    home.packages = [ pkgs.notectl ];
  };
}
