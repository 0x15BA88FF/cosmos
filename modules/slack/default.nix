{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.slack.enable = lib.mkEnableOption "Enable slack";

  config = lib.mkIf config.modules.home.slack.enable {
    home.packages = [ pkgs.slack ];
  };
}
