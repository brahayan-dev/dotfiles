#!/bin/bash

# Function to ping the workspace
ping() {
    ansible -i host.ini workspace -c local -m ping
}

# Function to install using ansible-playbook
install() {
    ansible-playbook -i host.ini -c local -K playbooks/main.yml
}

# Main script logic
case "$1" in
    "ping")
        ping
        ;;
    "install")
        install
        ;;
    *)
        echo "Usage: $0 {ping|install}"
        exit 1
        ;;
esac 