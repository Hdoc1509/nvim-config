-- Load plugins using io.popen() and builit-in commands
local config_path = vim.fn.stdpath('config')

for _, listed_element in ipairs(vim.fn.readdir(config_path .. '/lua/plugins')) do
  local filename = string.gsub(listed_element, '%.lua$', '')

  -- prevent load lua/plugins/init.lua again
  if filename ~= 'init' then
    -- print(listed_file)
    require('plugins.' .. filename)
  end
end
