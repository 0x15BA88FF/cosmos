{ lib, pkgs, ... }:
let
  hostname = "stellar";
in
{
  imports = [
    ../../hosts/15-dy4013dx.nix
    ./disko.nix
    ../../users
  ]
  ++ (import ../../modules).system;

  fileSystems = {
    "/" = {
      fsType = "ext4";
      device = "/dev/main_vg/root";
      options = [
        "noatime"
        "defaults"
      ];
    };
    "/nix" = {
      fsType = "ext4";
      device = "/dev/main_vg/nix";
      options = [
        "noatime"
        "defaults"
      ];
    };
    # "/var" = {
    #   fsType = "ext4";
    #   device = "/dev/main_vg/var";
    #   options = [
    #     "defaults"
    #     "noatime"
    #   ];
    # };
    "/boot/efi" = {
      fsType = "vfat";
      device = "/dev/disk/by-partlabel/disk-main-boot";
      options = [ "umask=0077" ];
    };
    "/home" = {
      fsType = "ext4";
      device = "/dev/main_vg/home";
      options = [
        "noatime"
        "defaults"
      ];
    };
  };

  # swapDevices = [
  #   {
  #     device = "/var/lib/swapfile";
  #     size = 12 * 1024;
  #   }
  # ];

  # zramSwap.enable = true;

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
    plymouth = {
      enable = true;
      theme = lib.mkForce "spinner_alt";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "spinner_alt" ];
        })
      ];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
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
    firewall = {
      enable = true;
      allowedTCPPorts = [ 8384 ];
    };
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
      ethernet.macAddress = "random";
    };
  };

  services = {
    dbus.enable = true;
    tailscale.enable = true;
    automatic-timezoned.enable = true;
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

  modules = {
    shared.stylix.enable = true;
    system.kanata.enable = true;
  };

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    localsend.enable = true;
    sway = {
      enable = true;
      extraPackages = [ ];
    };
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

    pkgs.file
    pkgs.winetricks
    pkgs.wineWow64Packages.waylandFull
  ];

  user.null.enable = true;

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
