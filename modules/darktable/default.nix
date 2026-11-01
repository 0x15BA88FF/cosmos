{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.darktable.enable = lib.mkEnableOption "Enable darktable";

  config = lib.mkIf config.modules.home.darktable.enable {
    home.packages = [ pkgs.darktable ];
  };
}
