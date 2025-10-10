{ pkgs }:
pkgs.writeShellApplication {
  name = "cht.sh";
  runtimeInputs = [ pkgs.tmux pkgs.fzf pkgs.curl pkgs.less ];
  text = ''
    lang=$(curl -s cht.sh/:list | fzf --prompt="Language/tool: ") || exit 0
    topics=$(curl -sf "https://cht.sh/$lang/:list" 2>/dev/null)

    if [ -n "$topics" ]; then
      topic=$(echo "$topics" | fzf --prompt="Topic: ") || exit 0
    else
      topic=$(echo "" | fzf --print-query --prompt="Query for $lang: ") || exit 0
    fi

    if [ -n "$topic" ]; then
      cmd="curl -s 'https://cht.sh/$lang/$topic' | less -R"
    else
      cmd="curl -s 'https://cht.sh/$lang' | less -R"
    fi

    if [ -n "$TMUX" ]; then
        tmux split-window -h "$cmd"
    else
        eval "$cmd"
    fi
  '';
}
