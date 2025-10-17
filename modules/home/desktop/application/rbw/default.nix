{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.modules.desktop.applications.rbw.enable = lib.mkEnableOption "Enable rbw";

  config = lib.mkIf config.modules.desktop.applications.rbw.enable {
    programs.rbw = {
      enable = true;
      settings = {
        pinentry = pkgs.pinentry-gtk2;
        email = "15ba88+bitwarden@proton.me";
      };
    };
    home.packages = [ pkgs.rofi-rbw ];
  };
}
