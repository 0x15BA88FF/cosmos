let
  sharedModules = [ ./stylix/default.nix ];

  homeModule =
    { lib, ... }:
    {
      imports = sharedModules ++ [
        ./alacritty
        ./atuin
        ./audacity
        ./blender
        ./brave
        ./btop
        ./claude-code
        ./clipcat
        ./codex
        ./cursor-cli
        ./devctl
        ./rmpc
        ./github-cli
        ./wine
        ./direnv
        ./mangohud
        ./discord
        ./easyeffects
        ./flameshot
        ./ghostty
        ./gimp
        ./git
        ./godot
        ./helium
        ./imv
        ./kdenlive
        ./lunar-client
        ./mpv
        ./nemo
        ./neru
        ./nvim
        ./obs-studio
        ./obsidian
        ./opencode
        ./prism-launcher
        ./qemu
        ./rbw
        ./rofi
        ./slack
        ./ssh
        ./starship
        ./sway
        ./swayidle
        ./swaync
        ./tmux
        ./yazi
        ./zathura
        ./zsh
        ./xdg
      ];

      modules.home = {
        alacritty.enable = lib.mkDefault false;
        atuin.enable = lib.mkDefault false;
        audacity.enable = lib.mkDefault false;
        blender.enable = lib.mkDefault false;
        brave.enable = lib.mkDefault false;
        btop.enable = lib.mkDefault false;
        claude-code.enable = lib.mkDefault false;
        clipcat.enable = lib.mkDefault false;
        codex.enable = lib.mkDefault false;
        cursor-cli.enable = lib.mkDefault false;
        devctl.enable = lib.mkDefault false;
        rmpc.enable = lib.mkDefault false;
        github-cli.enable = lib.mkDefault false;
        wine.enable = lib.mkDefault false;
        helium.enable = lib.mkDefault false;
        direnv.enable = lib.mkDefault false;
        mangohud.enable = lib.mkDefault false;
        discord.enable = lib.mkDefault false;
        easyeffects.enable = lib.mkDefault false;
        flameshot.enable = lib.mkDefault false;
        ghostty.enable = lib.mkDefault false;
        gimp.enable = lib.mkDefault false;
        git.enable = lib.mkDefault false;
        godot.enable = lib.mkDefault false;
        imv.enable = lib.mkDefault false;
        kdenlive.enable = lib.mkDefault false;
        lunar-client.enable = lib.mkDefault false;
        mpv.enable = lib.mkDefault false;
        nvim.enable = lib.mkDefault false;
        nemo.enable = lib.mkDefault false;
        neru.enable = lib.mkDefault false;
        obs-studio.enable = lib.mkDefault false;
        opencode.enable = lib.mkDefault false;
        obsidian.enable = lib.mkDefault false;
        prism-launcher.enable = lib.mkDefault false;
        qemu.enable = lib.mkDefault false;
        rbw.enable = lib.mkDefault false;
        rofi.enable = lib.mkDefault false;
        slack.enable = lib.mkDefault false;
        ssh.enable = lib.mkDefault false;
        starship.enable = lib.mkDefault false;
        sway.enable = lib.mkDefault false;
        swayidle.enable = lib.mkDefault false;
        swaync.enable = lib.mkDefault false;
        tmux.enable = lib.mkDefault false;
        yazi.enable = lib.mkDefault false;
        zathura.enable = lib.mkDefault false;
        zsh.enable = lib.mkDefault false;
        xdg.enable = lib.mkDefault false;
      };
    };

  systemModule =
    { lib, ... }:
    {
      imports = sharedModules ++ [
        ./kanata
      ];
      modules.system = {
        kanata.enable = lib.mkDefault false;
      };
    };
in
rec {
  home = [ homeModule ];
  system = [ systemModule ];
  all = home ++ system;
}
