{ config, lib, ... }:
{
  options.modules.desktop.applications.zathura.enable = lib.mkEnableOption "Enable zathura";

  config = lib.mkIf config.modules.desktop.applications.zathura.enable {
    programs.zathura = {
      enable = true;
      options = {
        recolor = true;
        selection-clipboard = "clipboard";
      };
    };
  };
}
