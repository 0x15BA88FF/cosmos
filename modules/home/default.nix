{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./atuin.nix
    ./brave.nix
    ./btop.nix
    ./clipcat.nix
    ./devctl.nix
    ./direnv.nix
    ./discord.nix
    ./easyeffects.nix
    ./flameshot.nix
    ./gemini-cli.nix
    ./git.nix
    ./imv.nix
    ./mpv.nix
    ./notectl.nix
    ./nvim.nix
    ./obs-studio.nix
    ./rbw.nix
    ./rofi.nix
    ./ssh.nix
    ./starship.nix
    ./sway.nix
    ./swaync.nix
    ./tmux.nix
    ./zathura.nix
    ./zsh.nix
  ];

  modules.home.alacritty.enable = lib.mkDefault true;
  modules.home.atuin.enable = lib.mkDefault true;
  modules.home.brave.enable = lib.mkDefault true;
  modules.home.btop.enable = lib.mkDefault true;
  modules.home.clipcat.enable = lib.mkDefault true;
  modules.home.devctl.enable = lib.mkDefault true;
  modules.home.direnv.enable = lib.mkDefault true;
  modules.home.discord.enable = lib.mkDefault true;
  modules.home.easyeffects.enable = lib.mkDefault true;
  modules.home.flameshot.enable = lib.mkDefault true;
  modules.home.gemini-cli.enable = lib.mkDefault true;
  modules.home.git.enable = lib.mkDefault true;
  modules.home.imv.enable = lib.mkDefault true;
  modules.home.mpv.enable = lib.mkDefault true;
  modules.home.notectl.enable = lib.mkDefault true;
  modules.home.nvim.enable = lib.mkDefault true;
  modules.home.obs-studio.enable = lib.mkDefault true;
  modules.home.rbw.enable = lib.mkDefault true;
  modules.home.rofi.enable = lib.mkDefault true;
  modules.home.ssh.enable = lib.mkDefault true;
  modules.home.starship.enable = lib.mkDefault true;
  modules.home.sway.enable = lib.mkDefault true;
  modules.home.swaync.enable = lib.mkDefault true;
  modules.home.tmux.enable = lib.mkDefault true;
  modules.home.zathura.enable = lib.mkDefault true;
  modules.home.zsh.enable = lib.mkDefault true;
}
