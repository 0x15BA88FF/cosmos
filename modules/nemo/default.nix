{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.nemo.enable = lib.mkEnableOption "Enable nemo";

  config = lib.mkIf config.modules.home.nemo.enable {
    home.packages = [ pkgs.nemo ];
  };
}
