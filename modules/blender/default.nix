{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.blender.enable = lib.mkEnableOption "Enable blender";

  config = lib.mkIf config.modules.home.blender.enable {
    home.packages = [ pkgs.blender ];
  };
}
