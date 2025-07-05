#!/usr/bin/env bash

# Source logging functions
source "$(dirname "${BASH_SOURCE[0]}")/logging.sh"

# Function to ping the workspace
ping_workspace() {
    local workspace_path="$1"

    cd "$workspace_path" || return
    ansible -i ../hosts.ini Workspace -c local -m ping
    return
}

# Function to setup the workspace
setup_workspace() {
    local workspace_path="$1"
    local playbook="$2"
    local ansible_opts=()

    cd "$workspace_path" || return

    if [[ -f "$workspace_path/.become_password" ]]; then
        ansible_opts+=(--become-password-file "$workspace_path/.become_password")
    fi

    if [[ -f "$workspace_path/.vault_password" ]]; then
        ansible_opts+=(--vault-password-file "$workspace_path/.vault_password")
    fi

    ANSIBLE_CONFIG="$workspace_path/$playbook/ansible.cfg" \
    ansible-playbook -c local \
        -i ../hosts.ini \
        "${ansible_opts[@]}" \
        "$playbook.yml"
    return
}

# Select playbook based on marker file
get_playbook_name() {
    if [[ -f ~/.akeptous ]]; then
        echo "akeptous"
    else
        echo "work"
    fi
}

# Install dependencies (simplified without OS detection)
install_dependencies() {
    log_info "Installing dependencies"
    
    # Check if we're on macOS or Linux and install accordingly
    if command -v brew &> /dev/null; then
        [ ! -e /opt/homebrew/bin/ansible ] && brew install ansible
    elif command -v dnf &> /dev/null; then
        [ ! -e /usr/bin/ansible ] && sudo dnf install ansible
    elif command -v apt &> /dev/null; then
        [ ! -e /usr/bin/ansible ] && sudo apt install ansible
    else
        log_error "Could not detect package manager to install ansible"
        return 1
    fi
}

# Remove symlinks
remove_symlinks() {
    log_info "Removing common symlinks"
    [ -L ~/.zshrc ] && rm ~/.zshrc
    [ -L ~/.zprofile ] && rm ~/.zprofile
    [ -L ~/.private_profile ] && rm ~/.private_profile
    [ -L ~/.config/ghostty ] && rm ~/.config/ghostty
    
    # Additional symlinks based on available files
    [ -L ~/.akeptousrc ] && rm ~/.akeptousrc
    [ -L ~/.akeptous_profile ] && rm ~/.akeptous_profile
    [ -L ~/.config/nvim ] && rm ~/.config/nvim
    [ -L ~/.workrc ] && rm ~/.workrc
    [ -L ~/.work_profile ] && rm ~/.work_profile
    [ -L ~/.config/doom ] && rm ~/.config/doom
}

# Execute ping command
execute_ping() {
    local workspace_path="$1"
    
    log_info "Executing ping"
    install_dependencies
    ping_workspace "$workspace_path"
}

# Execute setup command
execute_setup() {
    local workspace_path="$1"
    
    log_info "Executing setup"
    install_dependencies
    
    local playbook
    playbook=$(get_playbook_name) || exit 1
    setup_workspace "$workspace_path" "$playbook"
}

# Execute clean command
execute_clean() {
    log_info "Cleaning symlinks"
    remove_symlinks
} 
