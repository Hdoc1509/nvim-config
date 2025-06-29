local devicons = require('nvim-web-devicons')

---@param filename string
---@return string,string
local function get_icon(filename)
  local extension = vim.fn.fnamemodify(filename, ':e')

  if extension == 'hygen' then
    local _, _, target_extension = string.find(filename, '.*%.(%a+)(%.%a+)')
    local _, icon_color = devicons.get_icon_color('name.hygen', 'hygen')
    local icon = devicons.get_icon('name.' .. target_extension, target_extension)

    return icon, icon_color
  else
    return devicons.get_icon_color(filename, extension)
  end
end

return { get_icon = get_icon }
