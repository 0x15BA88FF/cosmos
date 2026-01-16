{ config, lib, ... }:
{
  options.modules.shell.direnv.enable = lib.mkEnableOption "Enable direnv";

  config = lib.mkIf config.modules.shell.direnv.enable {
    programs.direnv.enable = true;
  };
}
