{ pkgs, ... }:
let
  hostname = "stellar";
in
{
  imports = [
    ./disko-configuration.nix
    ./hardware-configuration.nix

    ../../users
    ../../modules/system
    ./../../modules/shared/stylix
  ];

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        device = "nodev";
        efiSupport = true;
        configurationLimit = 5;
      };
    };
  };

  hardware = {
    graphics.enable = true;
    opentabletdriver.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  virtualisation.docker.enable = true;

  networking = {
    hostName = hostname;
    firewall.enable = true;
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
      ethernet.macAddress = "random";
    };
  };

  services = {
    tor.enable = true;
    dbus.enable = true;
    tailscale.enable = true;
    automatic-timezoned.enable = true;
    smartd = {
      enable = true;
      notifications.wall.enable = true;
    };
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
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

  modules.input.kanata.enable = true;

  programs = {
    niri.enable = true;
    sway.enable = true;
    nix-ld.enable = true;
  };

  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-color-emoji
    pkgs.nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = [
    pkgs.git
    pkgs.vim
    pkgs.curl
    pkgs.home-manager
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };

  system = {
    stateVersion = "25.05";
    autoUpgrade.enable = true;
  };
}
