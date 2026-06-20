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
    github-cli.enable = true;
    git.enable = true;
    helium.enable = true;
    imv.enable = true;
    mangohud.enable = true;
    mpv.enable = true;
    nemo.enable = true;
    nvim.enable = true;
    obs-studio.enable = true;
    obsidian.enable = true;
    opencode.enable = true;
    prism-launcher.enable = true;
    rmpc.enable = true;
    rofi.enable = true;
    ssh.enable = true;
    starship.enable = true;
    sway.enable = true;
    swayidle.enable = true;
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
