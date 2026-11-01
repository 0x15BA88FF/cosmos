{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.lutris.enable = lib.mkEnableOption "Enable lutris with wine gaming stack";

  config = lib.mkIf config.modules.home.lutris.enable {
    home.packages = [
      pkgs.lutris
      pkgs.wineWow64Packages.stable
      pkgs.winetricks
      pkgs.gamemode
      pkgs.mangohud
      pkgs.vulkan-tools
      pkgs.cabextract
    ];
  };
}
