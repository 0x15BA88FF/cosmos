{ pkgs, lib, config, ... }:
let username = "null";
in
{
  options.user.${username}.enable =
    lib.mkEnableOption "Enable user ${username}";

  config = lib.mkIf config.user.${username}.enable {
    nixpkgs.config.allowUnfree = true;

    programs.zsh.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };

    users.users.${username} = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" "input" "uinput" ];

      packages = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk

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

    systemd.user.services.kanata = {
      description = "Kanata keyboard remapper";
      serviceConfig = {
        Type = "simple";
        Restart = "on-failure";
        ExecStart =
          "${pkgs.kanata}/bin/kanata --cfg /home/${username}/.config/kanata/kanata.kbd";
      };
      wantedBy = [ "default.target" ];
    };
  };
}
