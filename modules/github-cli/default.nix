{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.github-cli.enable = lib.mkEnableOption "Enable github-cli";

  config = lib.mkIf config.modules.home.github-cli.enable {
    home.packages = [ pkgs.gh ];
  };
}
