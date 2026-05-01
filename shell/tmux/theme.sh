#### COLOUR

tm_color_active=colour39
tm_color_inactive=colour24

color_status_bg=colour234
fmt_status_transparent="#[fg=$color_status_bg]"
fmt_status_plain="#[fg=colour245]"
fmt_status_bar_white="$fmt_status_transparent#[bg=colour254,bold]"

# Powerline separators (require Powerline-patched font in iTerm2)

# Status bar
set -g status-style "fg=$tm_color_active,bg=$color_status_bg"

# Pane borders
set -g pane-border-style "fg=$tm_color_inactive"
set -g pane-active-border-style "fg=$tm_color_active"

# Message text (overridden here to match theme)
set -g message-style "fg=$tm_color_active,bg=default"

# Pane number display
set -g display-panes-active-colour $tm_color_active
set -g display-panes-colour $tm_color_inactive

# Clock
setw -g clock-mode-colour $tm_color_active

tm_date="$fmt_status_plain %R  %d %b"
tm_host="$fmt_status_bar_white #h"
tm_session_name="$fmt_status_bar_white #S"

tm_color_status_white="#[fg=colour254,bg=colour234,nobold]"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# Status-left ends with arrow transitioning white→blue (active window color)
set -g status-left "$tm_session_name#[fg=colour254,bg=colour39,nobold]"
set -g status-right "$tm_date $tm_color_status_white$tm_host "

set -g window-status-format "$fmt_status_plain #I  #W"
set -g window-status-current-format "#{?#{==:#{window_index},0},#[fg=colour16],$fmt_status_transparent#[bg=colour39]#[fg=colour16]}#[bg=colour39,bold] #I  #W #[fg=colour39,bg=colour234,nobold]"
