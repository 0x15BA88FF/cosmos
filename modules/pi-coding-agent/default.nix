{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.pi-coding-agent.enable = lib.mkEnableOption "Enable pi coding agent";

  config = lib.mkIf config.modules.home.pi-coding-agent.enable {
    home.packages = [ pkgs.pi-coding-agent ];
  };
}
