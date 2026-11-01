let
  sharedModules = [ ./stylix/default.nix ];

  homeModule =
    { lib, ... }:
    {
      imports = sharedModules ++ [
        ./alacritty
        ./antigravity
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
        ./darktable
        ./voxtype
        ./rmpc
        ./github-cli
        ./lutris
        ./direnv
        ./pi-coding-agent
        ./mangohud
        ./discord
        ./easyeffects
        ./flameshot
        ./flatpak
        ./ghostty
        ./gimp
        ./krita
        ./git
        ./godot
        ./helium
        ./imv
        ./kanshi
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
        ./zotero
        ./zsh
        ./xdg
      ];

      modules.home = {
        alacritty.enable = lib.mkDefault false;
        antigravity.enable = lib.mkDefault false;
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
        darktable.enable = lib.mkDefault false;
        voxtype.enable = lib.mkDefault false;
        rmpc.enable = lib.mkDefault false;
        github-cli.enable = lib.mkDefault false;
        lutris.enable = lib.mkDefault false;
        helium.enable = lib.mkDefault false;
        direnv.enable = lib.mkDefault false;
        pi-coding-agent.enable = lib.mkDefault false;
        mangohud.enable = lib.mkDefault false;
        discord.enable = lib.mkDefault false;
        easyeffects.enable = lib.mkDefault false;
        flameshot.enable = lib.mkDefault false;
        flatpak.enable = lib.mkDefault false;
        ghostty.enable = lib.mkDefault false;
        gimp.enable = lib.mkDefault false;
        krita.enable = lib.mkDefault false;
        git.enable = lib.mkDefault false;
        godot.enable = lib.mkDefault false;
        imv.enable = lib.mkDefault false;
        kanshi.enable = lib.mkDefault false;
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
        zotero.enable = lib.mkDefault false;
        zsh.enable = lib.mkDefault false;
        xdg.enable = lib.mkDefault false;
      };
    };

  systemModule =
    { lib, ... }:
    {
      imports = sharedModules ++ [
        ./kanata
        ./steam
      ];
      modules.system = {
        kanata.enable = lib.mkDefault false;
        steam.enable = lib.mkDefault false;
      };
    };
in
rec {
  home = [ homeModule ];
  system = [ systemModule ];
  all = home ++ system;
}
