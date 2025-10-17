{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g set-titles on
      set -g automatic-rename on
      set -g set-titles-string "#T"

      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g detach-on-destroy off

      set -sg escape-time 10
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -a terminal-features "alacritty:RGB"
      set -g default-terminal "screen-256color"

      unbind r
      unbind C-b

      set -g prefix C-Space
      bind C-Space send-prefix

      setw -g mouse on
      setw -g mode-keys vi

      bind -n M-k select-pane -U
      bind -n M-j select-pane -D
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R

      bind -n M-L next-window
      bind -n M-H previous-window

      bind -n M-K switch-client -p
      bind -n M-J switch-client -n

      bind | split-window -h -c "#{pane_current_path}"
      bind \\ split-window -v -c "#{pane_current_path}"

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel

      bind-key r source-file ~/.config/tmux/tmux.conf

      bind-key D display-popup -E "dev-sessionizer"
      bind-key N run-shell "note-sessionizer"
      bind-key E run-shell "file-sessionizer"
      bind-key C display-popup -E "cht.sh"

      set -g status on
      set -g focus-events on
      set -g status-interval 1
      set -g status-position top
      set -g status-left-length "100"
      set -g status-right-length "100"

      set -g status-bg "black"
      set -g status-fg "white"

      setw -g message-style "bg=red fg=black"
      setw -g message-command-style "bg=blue fg=black"

      set -g pane-border-style "fg=blue"
      set -g pane-active-border-style "fg=red"

      setw -g window-status-separator ""
      setw -g window-status-style "fg=white"
      setw -g mode-style "bg=red fg=black bold"
      setw -g window-status-activity-style "fg=white"

      setw -g status-left "#[bg=red,fg=black]  #S #T #[bg=black] "
      setw -g status-right "#[bg=red,fg=black] #{?pane_mode,#{pane_mode},normal} "

      setw -g window-status-format "#[bg=red,fg=black] #I #[bg=black] "
      setw -g window-status-current-format "#[bg=red,fg=black] #I #[bg=blue,fg=red]#[bg=blue,fg=black] #W #[bg=black] "
    '';
  };

  home.packages = import ./scripts/default.nix { inherit pkgs; };
}
