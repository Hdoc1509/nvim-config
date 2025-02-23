local file_name_icons_config = require('icons.files.name')
local file_extension_icons_config = require('icons.files.extension')

local file_icons = {
  name = {},
  extension = {},
}

---@param config FileIconConfig
---@param config_name string
---@param category 'name' | 'extension'
local function set_config(config, config_name, category)
  local icon, color, name = config.icon, config.color, config.name

  if config.file_names ~= nil then
    for _, file_name in ipairs(config.file_names) do
      file_icons[category][file_name] = { icon = icon, color = color, name = name }
    end
  else
    file_icons[category][config_name] = { icon = icon, color = color, name = name }
  end
end

for config_name, config in pairs(file_name_icons_config) do
  set_config(config, config_name, 'name')
end

for config_name, config in pairs(file_extension_icons_config) do
  set_config(config, config_name, 'extension')
end

return file_icons
