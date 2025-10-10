{ config, ... }:
let dataHome = "${config.home.homeDirectory}/.local/share";
in
{
  programs.atuin = {
    enable = true;
    settings = {
      key_path = "${dataHome}/history/.key";
      db_path = "${dataHome}/history/.history.db";
      session_path = "${dataHome}/history/.session";

      style = "auto";
      show_tabs = false;
      show_preview = false;
      inline_height = 20;
      max_preview_height = 4;
      keymap_mode = "auto";
      word_jump_mode = "emacs";
    };
  };
}
