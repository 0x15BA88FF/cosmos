{ pkgs, lib, config, ... }: {
  options.systemModules.kanata.enable = lib.mkEnableOption "Enable kanata";

  config = lib.mkIf config.systemModules.kanata.enable {
    boot.kernelModules = [ "uinput" ];

    hardware.uinput.enable = true;

    systemd.services.kanata-internalKeyboard.serviceConfig.SupplementaryGroups =
      [ "input" "uinput" ];

    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

    services.kanata.enable = true;

    environment.systemPackages = with pkgs; [ kanata ];
  };
}
