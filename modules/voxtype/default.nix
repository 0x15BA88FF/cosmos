{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.voxtype.enable = lib.mkEnableOption "Enable voxtype";

  config = lib.mkIf config.modules.home.voxtype.enable {
    home.packages = [ pkgs.voxtype ];
  };
}
