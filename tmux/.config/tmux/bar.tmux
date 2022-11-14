set-option -g status-position bottom
set -g status-justify left
set -g status-style default
set -g status-bg "black"

set -g status-left "#[fg=green,bg=black]#[fg=black,bg=green]#S#[fg=green,bg=black] "
set -g status-left-length 50

set -g status-right "#[fg=brightgreen,bg=black]#[fg=black,bg=brightgreen]%Y-%m-%d %I:%M#[fg=brightgreen,bg=black] #[fg=green,bg=black]#[fg=brightwhite,bg=green]#H#[fg=green,bg=black]"
set -g status-right-length 50

set -g window-status-format "#[fg=magenta,bg=black]#[fg=black,bg=magenta]#W#[fg=magenta,bg=black] "

set -g window-status-current-format "#[fg=blue,bg=black]#[fg=brightwhite,bg=blue]#W#[fg=blue,bg=black] "

set -g window-status-separator ""
