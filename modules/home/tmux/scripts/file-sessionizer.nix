{ pkgs }:
pkgs.writeShellApplication {
  name = "file-sessionizer";
  runtimeInputs = [ pkgs.tmux pkgs.yazi ];
  text = ''
    tmux has-session -t yazi 2>/dev/null || tmux new-session -ds yazi -c "$HOME" yazi
    tmux switch-client -t yazi 2>/dev/null || tmux attach -t yazi
  '';
}
