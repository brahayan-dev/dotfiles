local M = {}

local shell = require "systems.library.common".shell
local set_ansible_cfg = require "systems.library.common".set_ansible_cfg

local paths = {
  vault_file = "systems/.vault_",
  become_file = "systems/.become_",
  hosts_file = "systems/hosts.ini",
}

M.not_found = function(_)
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
  shell { "gh", "auth", "login" }
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

M.connect = function(_)
  set_repository_origin()
  authenticate_github()
  refresh_token()
  set_ssh_key()
end

M.setup = function(file, playbook)
  return function(_)
    shell {
      set_ansible_cfg(file),
      "ansible-playbook", "-c", "local",
      string.format("-i %s", paths.hosts_file),
      string.format("--vault-password-file %s", paths.vault_file),
      string.format("--become-password-file %s", paths.become_file),
      playbook
    }
  end
end

M.ping = function(file)
  return function()
    shell {
      set_ansible_cfg(file),
      "ansible", "-c", "local", "-m", "ping",
      string.format("-i %s Workstation", paths.hosts_file)
    }
  end
end

return M
