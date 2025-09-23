{ pkgs, lib, config, ... }: {
  options.systemModules.tor.enable = lib.mkEnableOption "Enable tor";

  config = lib.mkIf config.systemModules.tor.enable {
    services.tor.enable = true;
    environment.systemPackages = with pkgs; [ tor ];
  };
}
