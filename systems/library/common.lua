local M = {}

function M.set_ansible_cfg(file)
  return "ANSIBLE_CONFIG=" .. file
end

function M.shell(parts)
  local cmd = table.concat(parts, " ")
  os.execute(cmd)
end

return M
