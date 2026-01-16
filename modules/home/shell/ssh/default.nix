{ config, lib, ... }:
{
  options.modules.shell.ssh.enable = lib.mkEnableOption "Enable ssh";

  config = lib.mkIf config.modules.shell.ssh.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
    };
    services.ssh-agent.enable = true;
  };
}
