local interactive = require "systems.library.interactive"
local nu = require "systems.library.work".nu

local paths = {
  ansible_cfg_file = "systems/work.cfg",
  setup_playbook_file = "systems/work.yml"
}

local commands = {
  refresh = nu,
  ping = interactive.ping(paths.ansible_cfg_file),
  setup = interactive.setup(paths.ansible_cfg_file, paths.setup_playbook_file),
}
(commands[arg[1]] or interactive.not_found)(arg)
