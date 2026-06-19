{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.codex.enable = lib.mkEnableOption "Enable codex";

  config = lib.mkIf config.modules.home.codex.enable {
    home.packages = [ pkgs.codex ];
  };
}
