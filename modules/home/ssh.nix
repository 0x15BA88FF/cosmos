{ config, lib, ... }:
{
  options.modules.home.ssh.enable = lib.mkEnableOption "Enable ssh";

  config = lib.mkIf config.modules.home.ssh.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
    };
    services.ssh-agent.enable = true;
  };
}
