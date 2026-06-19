{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.claude-code.enable = lib.mkEnableOption "Enable claude-code";

  config = lib.mkIf config.modules.home.claude-code.enable {
    home.packages = [ pkgs.claude-code ];
  };
}
