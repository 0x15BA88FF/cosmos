{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.kdenlive.enable = lib.mkEnableOption "Enable kdenlive";

  config = lib.mkIf config.modules.home.kdenlive.enable {
    home.packages = [ pkgs.kdePackages.kdenlive ];
  };
}
