{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.shell.devctl.enable = lib.mkEnableOption "Enable devctl";

  config = lib.mkIf config.modules.shell.devctl.enable {
    home.packages = [ pkgs.devctl ];
  };
}
