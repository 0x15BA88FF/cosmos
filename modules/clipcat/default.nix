{ lib, config, ... }:
{
  options.modules.home.clipcat.enable = lib.mkEnableOption "Enable clipcat";

  config = lib.mkIf config.modules.home.clipcat.enable {
    services.clipcat = {
      enable = true;
      daemonSettings = {
        daemonize = true;
        max_history = 5000;
        desktop_notification.enable = false;
      };
      menuSettings = {
        finder = "rofi";
        rofi.menu_length = 10;
      };
    };
  };
}
