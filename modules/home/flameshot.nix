{ config, lib, ... }:
{
  options.modules.home.flameshot.enable = lib.mkEnableOption "Enable flameshot";

  config = lib.mkIf config.modules.home.flameshot.enable {
    services.flameshot = {
      enable = true;
      settings = {
        General = {
          useGrimAdapter = true;
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          uiColor = "#7287fd";
          drawColor = "#fe640b";
          contrastUiColor = "#1e66f5";
          userColors = builtins.concatStringsSep ", " [
            "picker"
            "#d20f39"
            "#fe640b"
            "#df8e1d"
            "#40a02b"
            "#1e66f5"
            "#7287fd"
            "#dd7878"
            "#ea76cb"
          ];
          filenamePattern = "screenshot-%Y%m%d%H%M%S";
        };
      };
    };
  };
}
