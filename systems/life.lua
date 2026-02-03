local shell = require "systems.library.common".shell
local set_ansible_cfg = require "systems.library.common".set_ansible_cfg

local paths = {
  vault_file = "systems/.vault_",
  become_file = "systems/.become_",
  hosts_file = "systems/hosts.ini",
  ansible_cfg_file = "systems/life.cfg",
  setup_playbook_file = "systems/life.yml"
}

local not_found = function(_)
  print("Command Not Found\n")
end

local set_repository_origin = function()
  shell {
    "git", "remote",
    "set-url", "origin",
    "git@github.com:brahayan-dev/dotfiles.git"
  }
end

local authenticate_github = function()
  shell {
    "gh", "auth", "login"
  }
end

local refresh_token = function()
  shell {
    "gh", "auth", "refresh",
    "-h", "github.com",
    "-s", "admin:ssh_signing_key"
  }
end

local set_ssh_key = function()
  local home = os.getenv("HOME")
  local host = os.getenv("HOST")
  local user = os.getenv("USER")

  shell {
    "gh", "ssh-key", "add",
    string.format("%s/.ssh/%s_rsa.pub", home, user),
    string.format("-t Ak %s", host),
  }
end

local connect = function(_)
  set_repository_origin()
  authenticate_github()
  refresh_token()
  set_ssh_key()
end

local setup = function(_)
  shell {
    set_ansible_cfg(paths.ansible_cfg_file),
    "ansible-playbook", "-c", "local",
    string.format("-i %s", paths.hosts_file),
    string.format("--vault-password-file %s", paths.vault_file),
    string.format("--become-password-file %s", paths.become_file),
    paths.setup_playbook_file
  }
end

local ping = function(_)
  shell {
    set_ansible_cfg(paths.ansible_cfg_file),
    "ansible", "-c", "local", "-m", "ping",
    string.format("-i %s Workstation", paths.hosts_file)
  }
end

local commands = {
  ping = ping,
  setup = setup,
  connect = connect
}
(commands[arg[1]] or not_found)(arg)
