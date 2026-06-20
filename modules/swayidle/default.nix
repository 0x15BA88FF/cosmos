{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.swayidle.enable = lib.mkEnableOption "Enable swayidle";

  config = lib.mkIf config.modules.home.swayidle.enable {
    programs.swaylock.enable = true;

    services.swayidle =
      let
        lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
        display = status: "swaymsg 'output * power ${status}'";
      in
      {
        enable = true;
        timeouts = [
          {
            timeout = 300;
            command = lock;
          }
          {
            timeout = 330;
            command = display "off";
            resumeCommand = display "on";
          }
        ];
        events = {
          before-sleep = "${display "off"}; ${lock}";
          after-resume = "${display "on"}";
          lock = "${display "off"}; ${lock}";
          unlock = "${display "on"}";
        };
      };
  };
}
