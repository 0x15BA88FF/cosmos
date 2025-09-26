{ config, ... }:
let
  dataHome = config.xdg.dataHome or "${config.home.homeDirectory}/.local/share";
in
{
  programs.atuin = {
    enable = true;

    settings = {
      key_path = "${dataHome}/history/.key";
      db_path = "${dataHome}/history/.history.db";
      session_path = "${dataHome}/history/.session";

      show_help = true;
      show_tabs = false;

      style = "auto";
      inline_height = 20;
      show_preview = false;
      max_preview_height = 4;

      keymap_mode = "auto";
      word_jump_mode = "emacs";
    };
  };
}
