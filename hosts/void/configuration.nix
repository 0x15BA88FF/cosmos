{ pkgs, lib, config, ... }: {
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
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "void";
    firewall.enable = true;
    networkmanager.enable = true;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
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

  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = [ ];
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

  environment.etc."style-colors.txt".source = pkgs.writeText "style-colors" ''
    ${lib.concatStringsSep "\n"
    (lib.mapAttrsToList (name: val: "${name} = ${val}")
      config.style.colors.palette)}
  '';

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
