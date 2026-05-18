{ config, lib, ... }:
{
  options.modules.home.btop.enable = lib.mkEnableOption "Enable btop";

  config = lib.mkIf config.modules.home.btop.enable {
    programs.btop = {
      enable = true;
      settings.vim_keys = true;
    };
  };
}
