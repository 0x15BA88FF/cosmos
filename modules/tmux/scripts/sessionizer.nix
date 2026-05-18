{ pkgs }:
pkgs.writeShellApplication {
  name = "sessionizer";
  runtimeInputs = [
    pkgs.tmux
    pkgs.fzf
  ];
  text = ''
    tmux ls &>/dev/null || exit 1
    session=$(tmux ls | fzf | cut -d: -f1) || exit 0
    [[ -z $session ]] && exit 0
    if [[ -n $TMUX ]]; then
      tmux switch-client -t "$session"
    else
      tmux attach -t "$session"
    fi
  '';
}
