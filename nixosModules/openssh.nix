{ lib, config, ... }: {
  options.systemModules.openssh.enable = lib.mkEnableOption "Enable openssh";

  config = lib.mkIf config.systemModules.openssh.enable {
    services.openssh = {
      enable = true;
      settings.PermitRootLogin = "no";
    };
  };
}
