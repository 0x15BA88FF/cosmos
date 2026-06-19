{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.neru.enable = lib.mkEnableOption "Enable neru";

  config = lib.mkIf config.modules.home.neru.enable {
    home.packages = [ pkgs.neru ];
    systemd.user.services.neru = {
      Unit = {
        Description = "Neru keyboard navigation daemon";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${lib.getExe pkgs.neru} launch";
        Restart = "on-failure";
        RestartSec = 2;
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
