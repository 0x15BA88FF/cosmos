{
  pkgs,
  config,
  lib,
  ...
}:
let
  dataHome = "${config.xdg.dataHome}/atuin/";
in
{
  options.modules.home.atuin.enable = lib.mkEnableOption "Enable atuin";

  config = lib.mkIf config.modules.home.atuin.enable {
    programs.atuin = {
      enable = true;
      settings = {
        key_path = "${dataHome}/pub_key";
        db_path = "${dataHome}/history.db";
        session_path = "${dataHome}/session";
        style = "auto";
        inline_height = 20;
        keymap_mode = "auto";
      };
    };
    home.packages = [ pkgs.atuin ];
  };
}
