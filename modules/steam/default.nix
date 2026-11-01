{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.system.steam.enable = lib.mkEnableOption "Enable steam";

  config = lib.mkIf config.modules.system.steam.enable {
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
