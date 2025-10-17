{ pkgs, config, ... }:
let
  dataHome = "${config.xdg.dataHome}/atuin/";
in
{
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

  home.packages = with pkgs; [ atuin ];
}
