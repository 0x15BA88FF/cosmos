{ config, lib, ... }:

{
  options.modules.home.ssh.enable = lib.mkEnableOption "Enable ssh";

  config = lib.mkIf config.modules.home.ssh.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings = {
        "Host *" = {
          identityFile = "~/.ssh/id_ed25519";
          addKeysToAgent = "yes";
        };
      };
    };
  };
}
