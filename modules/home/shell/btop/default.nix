{ config, lib, ... }:
{
  options.modules.shell.btop.enable = lib.mkEnableOption "Enable btop";

  config = lib.mkIf config.modules.shell.btop.enable {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
