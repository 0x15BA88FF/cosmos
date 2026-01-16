{ lib, ... }:
{
  imports = [
    ./imv
    ./mpv
    ./rbw
    ./brave
    ./zathura
    ./discord
    ./alacritty
    ./flameshot
    ./obs-studio
  ];

  modules.desktop.applications.imv.enable = lib.mkDefault true;
  modules.desktop.applications.mpv.enable = lib.mkDefault true;
  modules.desktop.applications.rbw.enable = lib.mkDefault true;
  modules.desktop.applications.brave.enable = lib.mkDefault true;
  modules.desktop.applications.zathura.enable = lib.mkDefault true;
  modules.desktop.applications.discord.enable = lib.mkDefault true;
  modules.desktop.applications.alacritty.enable = lib.mkDefault true;
  modules.desktop.applications.flameshot.enable = lib.mkDefault true;
  modules.desktop.applications.obs-studio.enable = lib.mkDefault true;
}
