{ ... }: {
  programs.tmux = {
    enable = true;

    extraConfig = ''
      set -g set-titles on
      set -g history-limit 1000
      set -g automatic-rename on
      set -g set-titles-string "#T"

      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g detach-on-destroy off

      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*256col*:Tc"

      unbind r
      unbind C-b

      set -g prefix C-Space
      bind C-Space send-prefix

      setw -g mouse on
      setw -g mode-keys vi

      bind -n M-L next-window
      bind -n M-H previous-window

      bind -n M-k select-pane -U
      bind -n M-j select-pane -D
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R

      bind -n M-K switch-client -p
      bind -n M-J switch-client -n

      bind -r C-h resize-pane -L 5
      bind -r C-l resize-pane -R 5
      bind -r C-k resize-pane -U 5
      bind -r C-j resize-pane -D 5

      bind '|' split-window -h -c "#{pane_current_path}"
      bind '\' split-window -v -c "#{pane_current_path}"

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel

      bind-key r source-file ~/.config/tmux/tmux.conf
      bind-key E run-shell "~/.local/bin/files-sessionizer.sh"
      bind-key N run-shell "~/.local/bin/notes-sessionizer.sh"
      bind-key S run-shell "~/.local/bin/projects-sessionizer.sh"

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

      setw -g status-left "#[fg=red]#[bg=red,fg=black] #S #T#[fg=red,bg=black] "
      setw -g status-right "#[fg=red]#[bg=red,fg=black]#{?pane_mode,#{pane_mode},normal}#[fg=red,bg=black]"

      setw -g window-status-format "#[fg=red]#[bg=red,fg=black]#I#[fg=red,bg=black] "
      setw -g window-status-current-format "#[fg=red]#[bg=red,fg=black]#I #[bg=blue,fg=red]#[bg=blue,fg=black] #W#[fg=blue,bg=black] "
    '';
  };
}
