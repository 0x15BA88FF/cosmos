{ pkgs, lib, config, hostname, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../../users/default.nix
    ./../../modules/nixos/default.nix
  ];

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = hostname;
    firewall.enable = true;
    networkmanager.enable = true;
  };

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

  security.rtkit.enable = true;

  programs = {
    sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [ swayidle swaylock ];
    };
  };

  environment.systemPackages = with pkgs; [
    rofi
    swappy
    clipcat
    matugen
    rofimoji
    nautilus
    tesseract4
    pavucontrol
    brightnessctl
    networkmanagerapplet

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
  ];

  fonts.packages = map (font: font.package) (lib.attrValues
    (lib.filterAttrs (_name: font: font.package != null) config.style.fonts));
}
