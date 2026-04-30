#### COLOUR

# tm_prefix="☕ "
# tm_prefix="♨︎ "
tm_prefix="❏"
tm_color_active=colour39
tm_color_inactive=colour24
tm_color_feature=colour24
tm_color_music=colour24
tm_active_border_color=colour39

color_status_bg=colour234
fmt_status_transparent="#[fg=$color_status_bg]"
fmt_status_plain="#[fg=colour245]"
fmt_status_bar_white="$fmt_status_transparent#[bg=colour254,bold]"

# separators
tm_separator_left_bold="⮂"
tm_separator_left_thin="⮃"
tm_separator_right_bold="⮀"
tm_separator_right_thin="⮁"

# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg $color_status_bg
set-option -g status-attr default

# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_active_border_color

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

tm_date="$fmt_status_plain⮃ %R ⮃ %d %b" #"#[fg=$tm_color_inactive] %R %d %b"
tm_host="$fmt_status_bar_white #h" #"#[fg=$tm_color_feature,bold]#h"
tm_session_name="$fmt_status_bar_white #S" #" #[fg=$tm_color_feature,bold]$tm_prefix #S"

tm_color_status_white="#[fg=colour254,bg=colour234,nobold]"

# Custom status bar
# Powerline symbols: ⮂ ⮃ ⮀ ⮁ ⭤
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

set -g status-left $tm_session_name' '$tm_color_status_white'⮀'

set -g status-right $tm_date' '$tm_color_status_white'⮂'$tm_host' '

# default window title colors
#set -g window-status-format "$fmt_status_transparent#[bg=colour238]⮀#[fg=colour15,bg=colour238,bold] #I $fmt_status_transparent⮁#[fg=colour15,bg=colour238,bold] #W #[fg=colour238,bg=colour234,nobold]⮀"
set -g window-status-format "$fmt_status_plain #I ⮁ #W"

# active window title colors
set -g window-status-current-format "$fmt_status_transparent#[bg=colour39]⮀#[noreverse,bold] #I ⮁ #W #[fg=colour39,bg=colour234,nobold]⮀"


