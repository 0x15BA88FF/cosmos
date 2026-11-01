{ ... }:
let
  username = "null";
in
{
  imports = (import ../../modules).home;

  programs.home-manager.enable = true;

  modules.shared.stylix.enable = true;

  modules.home = {
    antigravity.enable = true;
    atuin.enable = true;
    btop.enable = true;
    blender.enable = true;
    clipcat.enable = true;
    codex.enable = true;
    cursor-cli.enable = false;
    darktable.enable = true;
    devctl.enable = true;
    direnv.enable = true;
    discord.enable = true;
    easyeffects.enable = true;
    flameshot.enable = true;
    flatpak.enable = true;
    ghostty.enable = true;
    github-cli.enable = true;
    git.enable = true;
    gimp.enable = true;
    godot.enable = true;
    helium.enable = true;
    imv.enable = true;
    kanshi.enable = false;
    kdenlive.enable = true;
    krita.enable = true;
    mangohud.enable = false;
    mpv.enable = true;
    nemo.enable = true;
    nvim.enable = true;
    obs-studio.enable = true;
    obsidian.enable = true;
    opencode.enable = true;
    pi-coding-agent.enable = false;
    prism-launcher.enable = true;
    rmpc.enable = false;
    rofi.enable = true;
    ssh.enable = true;
    starship.enable = true;
    sway.enable = true;
    swayidle.enable = true;
    swaync.enable = true;
    tmux.enable = true;
    voxtype.enable = false;
    lutris.enable = true;
    xdg.enable = true;
    zathura.enable = true;
    zotero.enable = true;
    zsh.enable = true;
  };

  home = {
    username = username;
    stateVersion = "26.05";
    homeDirectory = "/home/${username}";
  };
}
