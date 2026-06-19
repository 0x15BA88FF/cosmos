{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.rbw.enable = lib.mkEnableOption "Enable rbw";

  config = lib.mkIf config.modules.home.rbw.enable {
    programs.rbw = {
      enable = true;
      settings = {
        pinentry = pkgs.pinentry-gtk2;
        base_url = "https://vault.bitwarden.eu";
      };
    };
    home.packages = [
      pkgs.rofi-rbw
    ];
  };
}
