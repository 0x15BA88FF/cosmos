{ ... }:
let hostname = "stellar";
in
{
  imports = [
    # ./disko-configuration.nix
    ./hardware-configuration.nix

    ../../users/default.nix
    ../../modules/system/default.nix
  ];

  age.secrets."luks-secret-${hostname}".file =
    ../../secrets/luks-secret-${hostname}.age;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 5;
    };

    # initrd = {
    #   systemd.enable = true;
    #   luks.devices."crypted" = {
    #     preLVM = true;
    #     allowDiscards = true;
    #     bypassWorkqueues = true;
    #     fallbackToPassword = true;
    #     keyFile = "/tmp/luks-secret-${hostname}";
    #     crypttabExtraOpts = [ "tpm2-device=auto" ];
    #   };
    #   secrets."/tmp/luks-secret-${hostname}" =
    #     config.age.secrets."luks-secret-${hostname}".path;
    # };

    # kernelModules = [ "dm-snapshot" ];
  };

  swapDevices = [{
    size = 8096;
    device = "/swapfile";
  }];

  security.rtkit.enable = true;

  virtualisation.docker.enable = true;

  networking = {
    hostName = hostname;
    firewall.enable = true;
    networkmanager.enable = true;
  };

  services = {
    tor.enable = true;
    tailscale.enable = true;
    automatic-timezoned.enable = true;
    smartd = {
      enable = true;
      notifications.wall.enable = true;
    };
    openssh = {
      enable = true;
      settings.PermitRootLogin = "no";
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

  # desktop.sway.enable = true; # checkme

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
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  system = {
    stateVersion = "25.05";
    autoUpgrade.enable = true;
  };
}
