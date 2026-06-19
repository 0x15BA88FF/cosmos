{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.prism-launcher.enable = lib.mkEnableOption "Enable prism-launcher";

  config = lib.mkIf config.modules.home.prism-launcher.enable {
    home.packages = [ pkgs.prismlauncher ];
  };
}
