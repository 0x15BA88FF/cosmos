let
  sharedModules = [ ./stylix ];

  homeModule =
    { lib, ... }:
    {
      imports = sharedModules ++ [
        ./alacritty
        ./atuin
        ./audacity
        ./brave
        ./btop
        ./clipcat
        ./codex
        ./devctl
        ./direnv
        ./discord
        ./easyeffects
        ./flameshot
        ./gemini-cli
        ./gimp
        ./git
        ./imv
        ./kdenlive
        ./mpv
        ./nemo
        ./nvim
        ./obs-studio
        ./obsidian
        ./opencode
        ./rbw
        ./rofi
        ./ssh
        ./starship
        ./sway
        ./swaync
        ./tmux
        ./vscode
        ./zathura
        ./zsh
      ];

      modules.home.alacritty.enable = lib.mkDefault true;
      modules.home.atuin.enable = lib.mkDefault true;
      modules.home.audacity.enable = lib.mkDefault true;
      modules.home.brave.enable = lib.mkDefault true;
      modules.home.btop.enable = lib.mkDefault true;
      modules.home.clipcat.enable = lib.mkDefault true;
      modules.home.codex.enable = lib.mkDefault true;
      modules.home.devctl.enable = lib.mkDefault true;
      modules.home.direnv.enable = lib.mkDefault true;
      modules.home.discord.enable = lib.mkDefault true;
      modules.home.easyeffects.enable = lib.mkDefault true;
      modules.home.flameshot.enable = lib.mkDefault true;
      modules.home.gemini-cli.enable = lib.mkDefault true;
      modules.home.gimp.enable = lib.mkDefault true;
      modules.home.git.enable = lib.mkDefault true;
      modules.home.imv.enable = lib.mkDefault true;
      modules.home.kdenlive.enable = lib.mkDefault true;
      modules.home.mpv.enable = lib.mkDefault true;
      modules.home.nvim.enable = lib.mkDefault true;
      modules.home.nemo.enable = lib.mkDefault true;
      modules.home.obs-studio.enable = lib.mkDefault true;
      modules.home.opencode.enable = lib.mkDefault true;
      modules.home.obsidian.enable = lib.mkDefault true;
      modules.home.rbw.enable = lib.mkDefault true;
      modules.home.rofi.enable = lib.mkDefault true;
      modules.home.ssh.enable = lib.mkDefault true;
      modules.home.starship.enable = lib.mkDefault true;
      modules.home.sway.enable = lib.mkDefault true;
      modules.home.swaync.enable = lib.mkDefault true;
      modules.home.tmux.enable = lib.mkDefault true;
      modules.home.vscode.enable = lib.mkDefault true;
      modules.home.zathura.enable = lib.mkDefault true;
      modules.home.zsh.enable = lib.mkDefault true;
    };

  systemModule =
    { lib, ... }:
    {
      imports = sharedModules ++ [ ./kanata ];
      modules.system.kanata.enable = lib.mkDefault false;
    };
in
rec {
  home = [ homeModule ];
  system = [ systemModule ];
  all = home ++ system;
}
