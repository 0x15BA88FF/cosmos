{ pkgs, lib, config, ... }: {
  options.systemModules.kanata.enable = lib.mkEnableOption "Enable kanata";

  config = lib.mkIf config.systemModules.kanata.enable {
    hardware.uinput.enable = true;
    boot.kernelModules = [ "uinput" ];
    systemd.services.kanata-internalKeyboard.serviceConfig.SupplementaryGroups =
      [ "input" "uinput" ];
    services = {
      kanata.enable = true;
      udev.extraRules = ''
        KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
      '';
    };
    environment.systemPackages = with pkgs; [ kanata ];
  };
}
