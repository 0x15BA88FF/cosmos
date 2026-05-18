{ config, lib, ... }:
{
  options.modules.home.zathura.enable = lib.mkEnableOption "Enable zathura";

  config = lib.mkIf config.modules.home.zathura.enable {
    programs.zathura = {
      enable = true;
      options = {
        recolor = true;
        selection-clipboard = "clipboard";
      };
    };
  };
}
