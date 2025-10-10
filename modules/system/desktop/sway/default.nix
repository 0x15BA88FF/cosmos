{ pkgs, ... }: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; [
      curl
      swaybg
      swayidle
      swaylock

      flameshot
      # obs-studio
      wf-recorder

      swappy
      nautilus
      quickshell
      pavucontrol
      brightnessctl
      networkmanagerapplet

      wtype
      hyprpicker

      clipcat
      wl-clipboard

      rofi
      rofi-rbw
      rofimoji

      waybar
      swaynotificationcenter
    ];
  };
}
