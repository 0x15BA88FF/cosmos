{ config, lib, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=5";
      strategy = [ "history" "completion" ];
    };
    history.path = "${config.xdg.dataHome}/shell/history/bash";
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    shellAliases = { };
    initContent = lib.mkOrder 500 ''
      [[ $- != *i* ]] && return
      [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit; }
      [[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ]] && source "$XDG_CONFIG_HOME/shell/aliasrc"

      preexec() { echo ""; }

      bindkey "^Z" undo
      bindkey "^Y" redo
      bindkey '^[' vi-cmd-mode
      bindkey "^E" end-of-line
      bindkey "^A" beginning-of-line

      _exists() { command -v "$1" &>/dev/null; }

      _exists zoxide && alias cd="z"
      _exists bat && alias cat="bat"
      _exists nvim && alias vim="nvim"
      _exists btop && alias top="btop"
      _exists less && alias more="less"
      _exists paru && alias pacman="paru"
      _exists exa &&
          alias ls="eza -h --icons=auto --color=auto --group-directories-first -A" ||
          alias ls="ls -h --color=auto --group-directories-first -A"

      alias dev="devault"
      alias ip="ip -color=auto"
      alias diff="diff --color=auto"
      alias diff="diff --color=auto"
      alias grep="grep --color=auto"
      alias fgrep="fgrep --color=auto"
      alias egrep="egrep --color=auto"
    '';
  };
}
