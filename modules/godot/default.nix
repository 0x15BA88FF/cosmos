{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.godot.enable = lib.mkEnableOption "Enable godot";

  config = lib.mkIf config.modules.home.godot.enable {
    home.packages = [ pkgs.godot ];
  };
}
