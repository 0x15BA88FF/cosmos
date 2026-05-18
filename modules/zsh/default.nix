{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.modules.home.zsh.enable = lib.mkEnableOption "Enable zsh";

  config = lib.mkIf config.modules.home.zsh.enable {
    programs.zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
        highlight = "fg=5";
        strategy = [
          "history"
          "completion"
        ];
      };
      syntaxHighlighting.enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      initContent = lib.mkOrder 500 ''
        [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session; }

        preexec() { echo "" };

        bindkey "^E" end-of-line
        bindkey "^A" beginning-of-line
      '';
    };
    home.packages = [
      pkgs.jq
      pkgs.fzf
      pkgs.tree
    ];
  };
}
