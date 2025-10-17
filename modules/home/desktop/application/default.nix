{ lib, ... }:
{
  imports = [
    ./imv/default.nix
    ./mpv/default.nix
    ./rbw/default.nix
    ./chromium/default.nix
    ./zathura/default.nix
    ./discord/default.nix
    ./zoom-us/default.nix
    ./alacritty/default.nix
    ./flameshot/default.nix
    ./obs-studio/default.nix
    ./qutebrowser/default.nix
  ];

  modules.desktop.applications.imv.enable = lib.mkDefault true;
  modules.desktop.applications.mpv.enable = lib.mkDefault true;
  modules.desktop.applications.rbw.enable = lib.mkDefault true;
  modules.desktop.applications.chromium.enable = lib.mkDefault true;
  modules.desktop.applications.zathura.enable = lib.mkDefault true;
  modules.desktop.applications.discord.enable = lib.mkDefault true;
  modules.desktop.applications.zoom-us.enable = lib.mkDefault true;
  modules.desktop.applications.alacritty.enable = lib.mkDefault true;
  modules.desktop.applications.flameshot.enable = lib.mkDefault true;
  modules.desktop.applications.obs-studio.enable = lib.mkDefault true;
  modules.desktop.applications.qutebrowser.enable = lib.mkDefault true;
}
