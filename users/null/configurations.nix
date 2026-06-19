{ ... }:
let
  username = "null";
in
{
  imports = (import ../../modules).home;

  programs.home-manager.enable = true;

  modules.shared.stylix.enable = true;

  modules.home = {
    atuin.enable = true;
    btop.enable = true;
    clipcat.enable = true;
    codex.enable = true;
    cursor-cli.enable = true;
    devctl.enable = true;
    direnv.enable = true;
    discord.enable = true;
    easyeffects.enable = true;
    flameshot.enable = true;
    ghostty.enable = true;
    git.enable = true;
    hyprland.enable = true;
    helium.enable = true;
    imv.enable = true;
    mpv.enable = true;
    nemo.enable = true;
    nvim.enable = true;
    obs-studio.enable = true;
    obsidian.enable = true;
    opencode.enable = true;
    prism-launcher.enable = true;
    rofi.enable = true;
    ssh.enable = true;
    starship.enable = true;
    sway.enable = true;
    swaync.enable = true;
    tmux.enable = true;
    wine.enable = true;
    xdg.enable = true;
    zathura.enable = true;
    zsh.enable = true;
  };

  home = {
    username = username;
    stateVersion = "26.05";
    homeDirectory = "/home/${username}";
  };
}
