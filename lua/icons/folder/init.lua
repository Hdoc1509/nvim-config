local folder_icons_config = require('icons.folder.configs')

local folder_icons = {}

---@param config_name string
---@param config FolderIconConfig
local function set_config(config_name, config)
  folder_icons[config_name] = { icon = config.icon, hl = config.hl }
end

for config_name, config in pairs(folder_icons_config) do
  if config.folder_names ~= nil then
    for _, folder_name in ipairs(config.folder_names) do
      set_config(folder_name, config)
    end
  else
    set_config(config_name, config)
  end
end

-- print(vim.inspect(folder_icons))

return folder_icons
