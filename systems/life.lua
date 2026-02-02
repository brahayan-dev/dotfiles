local hosts_file = "systems/hosts.ini"
local ansible_cfg_file = "systems/life.cfg"
local setup_playbook_file = "systems/life.yml"

local not_found = function(_)
  print("Command Not Found\n")
end

local connect = function()

end

local set_ansible_cfg = function(file)
  return "ANSIBLE_CONFIG=" .. file
end

local setup = function(_)

end

local ping = function(_)
  local parts = {
    set_ansible_cfg(ansible_cfg_file),
    "ansible",
    "-i " .. hosts_file,
    "Workstation",
    "-c local",
    "-m ping"
  }
  local cmd = table.concat(parts, " ")

  os.execute(cmd)
end

local commands = {
  ping = ping,
  setup = setup,
  connect = connect
}
(commands[arg[1]] or not_found)(arg)
