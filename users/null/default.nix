{ pkgs, lib, config, ... }:
let
  username = "null";
  homeDirectory = "/home/${username}";
in
{
  options.user.${username}.enable =
    lib.mkEnableOption "Enable user ${username}";

  config = lib.mkIf config.user.${username}.enable {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = [ pkgs.home-manager ];

    home-manager = {
      backupFileExtension = "bak";
      extraSpecialArgs.style = config.style;
      users.${username} = {
        imports = [ ./../../modules/home/default.nix ];

        home.username = username;
        home.stateVersion = "25.05";
        home.homeDirectory = homeDirectory;
        programs.home-manager.enable = true;
      };
    };

    programs.zsh.enable = true;

    systemd.user.services.kanata = {
      description = "Kanata keyboard remapper";
      serviceConfig = {
        Type = "simple";
        Restart = "on-failure";
        ExecStart =
          "${pkgs.kanata}/bin/kanata --cfg ${homeDirectory}/.config/kanata/kanata.kbd";
      };
      wantedBy = [ "default.target" ];
    };

    users.users.${username} = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" "input" "uinput" ];

      packages = with pkgs; [
        jq
        fd
        rbw
        fzf
        eza
        bat
        git
        zsh
        stow
        tree
        btop
        yazi
        curl
        wget
        tmux
        atuin
        aria2
        unzip
        ngrok
        yt-dlp
        pandoc
        neovim
        zoom-us
        ripgrep
        gitleaks
        pinentry
        rofi-rbw
        starship
        fastfetch
        # texlive-full

        gcc
        rustup
        gnumake
        nodejs_24
        python314

        mpv
        zathura
        discord
        zathura
        openutau
        chromium
        qutebrowser
        mpvScripts.mpris
      ];
    };
  };
}
