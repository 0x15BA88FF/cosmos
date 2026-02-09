{ pkgs }:
pkgs.writeShellApplication {
  name = "file-sessionizer";
  runtimeInputs = [
    pkgs.tmux
    pkgs.nnn
  ];
  text = ''
    tmux has-session -t nnn 2>/dev/null || tmux new-session -ds nnn -c "$HOME" nnn
    tmux switch-client -t nnn 2>/dev/null || tmux attach -t nnn
  '';
}
