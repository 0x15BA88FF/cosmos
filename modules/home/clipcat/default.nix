{ ... }:
{
  services.clipcat = {
    enable = true;
    daemonSettings = {
      max_history = 1000;
      desktop_notification.enable = false;
    };
    menuSettings = {
      finder = "rofi";
      rofi.menu_length = 10;
    };
  };
}
