#!/usr/bin/env bash

# Source logging functions
source "$(dirname "${BASH_SOURCE[0]}")/logging.sh"

# Constants
readonly GHOSTTY_CONFIG="$HOME/.config/ghostty/config"

# Change theme function
change_theme() {
    local theme="$1"
    local file_path="$HOME/.dotfiles/ghostty/$theme"

    if [[ -f "$file_path" ]]; then
        ln -sf "$file_path" "$GHOSTTY_CONFIG"
        pkill -x ghostty && ghostty &
        return 0
    fi

    log_error "Configuration file not found: $file_path"
    return 1
}

# Execute day theme
execute_day() {
    log_info "Setting day theme"
    change_theme "day"
}

# Execute night theme
execute_night() {
    log_info "Setting night theme"
    change_theme "night"
} 