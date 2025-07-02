#!/usr/bin/env bash

# Source logging functions
source "$(dirname "${BASH_SOURCE[0]}")/logging.sh"

# Constants
readonly DOTFILES_DIR="$HOME/.dotfiles"
readonly SUPPORTED_COMMANDS=("ping" "setup" "clean" "github" "connect" "day" "night" "doom" "icon" "mark")

# Mark function
mark() {
    touch ~/.akeptous
}

# Validation functions
validate_command() {
    local command="$1"
    local valid_cmd

    for valid_cmd in "${SUPPORTED_COMMANDS[@]}"; do
        if [[ "$command" == "$valid_cmd" ]]; then
            return 0
        fi
    done

    log_error "Invalid command: $command"
    return 1
}

validate_workspace() {
    local workspace_path="$1"

    if [[ ! -d "$workspace_path" ]]; then
        log_error "Workspace directory not found: $workspace_path"
        return 1
    fi

    return 0
}

# Get workspace path (simplified without OS detection)
get_workspace_path() {
    local workspace_type="$1"
    
    # Default to looking for both possible workspace directories
    if [[ -d "$DOTFILES_DIR/ansible/darwin" && -f ~/.akeptous ]]; then
        echo "$DOTFILES_DIR/ansible/linux"
    elif [[ -d "$DOTFILES_DIR/ansible/darwin" ]]; then
        echo "$DOTFILES_DIR/ansible/darwin"
    elif [[ -d "$DOTFILES_DIR/ansible/linux" ]]; then
        echo "$DOTFILES_DIR/ansible/linux"
    else
        log_error "No ansible workspace directory found"
        return 1
    fi
}

# Ensure dotfiles directory exists
ensure_dotfiles_dir() {
    if [[ ! -d "$DOTFILES_DIR" ]]; then
        log_warn "Dotfiles directory not found, creating: $DOTFILES_DIR"
        mkdir -p "$DOTFILES_DIR"
    fi
}

# Execute mark command
execute_mark() {
    log_info "Marking workspace"
    mark
}

# Usage information
show_usage() {
    cat <<EOF
Usage: $0 <command>

Commands:
    ping     - Install dependencies and ping workspace
    setup    - Install dependencies and setup workspace
    clean    - Remove symlinks
    github   - Set up SSH key for GitHub
    connect  - Connect dotfiles repository to GitHub by SSH
    doom     - Install Doom over Emacs
    icon     - Change Emacs icon to Doom icon
    night    - Set the Ghostty's dark theme
    day      - Set the Ghostty's light theme
    mark     - Mark workspace as akeptous

EOF
} 