{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.cursor-cli.enable = lib.mkEnableOption "Enable cursor-cli";

  config = lib.mkIf config.modules.home.cursor-cli.enable {
    home.packages = [ pkgs.cursor-cli ];
  };
}
