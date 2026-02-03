local interactive = require "systems.library.interactive"

local paths = {
  ansible_cfg_file = "systems/life.cfg",
  setup_playbook_file = "systems/life.yml"
}

local commands = {
  connect = interactive.connect,
  ping = interactive.ping(paths.ansible_cfg_file),
  setup = interactive.setup(paths.ansible_cfg_file, paths.setup_playbook_file),
}
(commands[arg[1]] or interactive.not_found)(arg)
