local v = vim.o

do
  local options = {
	  number = true,
	  expandtap = true,
	  relativenumber = true,
	  clipboard = "unnamedplus",
	  wrap = false
  }
  
  for option, value in pairs(options) do
	  v[option] = value
  end
end

return {}
