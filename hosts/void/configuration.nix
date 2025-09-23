{ pkgs, lib, ... }: {
  imports = [
    # ./disko-configuration.nix
    ./hardware-configuration.nix
    ./../../users/default.nix
    ./../../nixosModules/default.nix
  ];

  boot = {
    loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    plymouth = {
      enable = true;
      theme = lib.mkForce "hexagon_dots";
      themePackages = with pkgs; [ adi1090x-plymouth-themes ];
    };
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "void";
    firewall.enable = true;
    networkmanager.enable = true;
  };

  hardware.bluetooth.enable = true;

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  security.rtkit.enable = true;

  services = {
    dbus.enable = true;
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

  services.xserver = {
    enable = true;
    desktopManager = { xterm.enable = false; };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ dmenu i3status i3lock i3blocks ];
    };
  };
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  programs.dconf.enable = true;

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
    blueman
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

  system.stateVersion = "25.05";
}
