local folder_icons_config = require('icons.folder.configs')

---@class (exact) FolderIconConfig
---@field icon? string
---@field hl string
---@field folder_names? string[]

local folder_icons = {}

for config_name, config in pairs(folder_icons_config) do
  if config.folder_names ~= nil then
    for _, folder_name in ipairs(config.folder_names) do
      folder_icons[folder_name] = { icon = config.icon, hl = config.hl }
    end
  else
    folder_icons[config_name] = { icon = config.icon, hl = config.hl }
  end
end

-- print(vim.inspect(folder_icons))

return folder_icons
