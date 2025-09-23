{ pkgs, lib, config, ... }: {
  options.systemModules.docker.enable = lib.mkEnableOption "Enable docker";

  config = lib.mkIf config.systemModules.docker.enable {
    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [ docker ];
  };
}
