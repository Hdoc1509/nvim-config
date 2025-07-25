---@class BaseIcons
---@field filename table<string, Icon>
---@field extension table<string, Icon>

---@class (exact) FileIconConfig
---@field icon string
---@field color string
---@field name string
---@field file_names? string[]

---@type table<string, table<string, FileIconConfig>>
local file_icons = { name = {}, extension = {} }

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

return {
  ---@param base_icons BaseIcons
  name = function(base_icons)
    local name_configs = require('icons.files.name').generate(base_icons)

    for config_name, config in pairs(name_configs) do
      set_config(config, config_name, 'name')
    end

    return file_icons.name
  end,
  ---@param base_icons BaseIcons
  extension = function(base_icons)
    local extension_configs = require('icons.files.extension').generate(base_icons)

    for config_name, config in pairs(extension_configs) do
      set_config(config, config_name, 'extension')
    end

    return file_icons.extension
  end,
}
