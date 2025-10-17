{ ... }:
{
  services.swaync = {
    enable = true;
    settings = {
      control-center-width = 350;
      notification-window-width = 350;
      notification-inline-replies = true;
      widgets = [
        "dnd"
        "notifications"
        "mpris"
      ];
    };
    style = ''
      .notification, .control-center {
        margin: 8px;
      }
    '';
  };
}
