{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../../users/default.nix
    ./../../modules/nixos/default.nix
  ];

  boot = {
    loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      configurationLimit = 3;
    };
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "void";
    firewall.enable = true;
    networkmanager.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    automatic-timezoned.enable = true;
    displayManager.ly = {
      enable = true;
      settings.animation = "matrix";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [ swayidle swaylock ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk

    rofi
    swappy
    clipcat
    matugen
    rofimoji
    tesseract4
    quickshell
    pavucontrol
    brightnessctl
    networkmanagerapplet

    pcmanfm

    imv
    wtype
    swww
    grim
    slurp
    waybar
    hyprpicker
    wf-recorder
    wl-clipboard
    swaynotificationcenter

    curl
    neovim
    alacritty
    home-manager
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
    stateVersion = "25.05";
  };
}
