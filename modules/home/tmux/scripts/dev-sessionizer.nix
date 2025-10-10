{ pkgs }:
pkgs.writeShellApplication {
  name = "dev-sessionizer";
  runtimeInputs = [ pkgs.tmux pkgs.fzf pkgs.devctl ];
  text = ''
    project=$(devctl find . | fzf --prompt="Select project: ")
    [[ -z "$project" ]] && exit 0
    session=$(basename "$project" | tr '.' '*' | tr -cd '[:alnum:]*-' | cut -c1-50)
    if tmux has-session -t "$session" 2>/dev/null; then
      tmux switch-client -t "$session" 2>/dev/null || tmux attach -t "$session"
    else
      tmux new-session -ds "$session" -c "$project" -n main
      tmux switch-client -t "$session" 2>/dev/null || tmux attach -t "$session"
    fi
  '';
}
