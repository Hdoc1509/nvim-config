local extension_configs = require('icons.files.extension')

---@class BaseIcons
---@field filename table<string, Icon>
---@field extension table<string, Icon>

---@class (exact) FileIconConfig
---@field icon string
---@field color string
---@field name string
---@field file_names? string[]

---@type table<string, table<string, FileIconConfig>>
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

for config_name, config in pairs(extension_configs) do
  set_config(config, config_name, 'extension')
end

return {
  name = {
    ---@param base_icons BaseIcons
    setup = function(base_icons)
      local name_configs = require('icons.files.name').setup(base_icons)

      for config_name, config in pairs(name_configs) do
        set_config(config, config_name, 'name')
      end

      -- TODO: return vim.tbl_map(name_configs)
      return file_icons.name
    end,
  },
  extension = file_icons.extension,
}
