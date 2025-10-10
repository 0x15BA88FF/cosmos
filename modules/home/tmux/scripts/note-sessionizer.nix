{ pkgs }:
pkgs.writeShellApplication {
  name = "note-sessionizer";
  runtimeInputs = [ pkgs.tmux pkgs.notectl ];
  text = ''
    tmux has-session -t notes 2>/dev/null || tmux new-session -ds notes -c "$(notectl path)"
    tmux switch-client -t notes 2>/dev/null || tmux attach -t notes
  '';
}
