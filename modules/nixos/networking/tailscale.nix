{ pkgs, lib, config, ... }: {
  options.systemModules.tailscale.enable =
    lib.mkEnableOption "Enable tailscale";

  config = lib.mkIf config.systemModules.tailscale.enable {
    services.tailscale.enable = true;
    environment.systemPackages = with pkgs; [ tailscale ];
  };
}
