local devicons = require('nvim-web-devicons')

---@param filename string
---@return string,string
local function get_icon(filename)
  local extension = vim.fn.fnamemodify(filename, ':e')

  if extension == 'hygen' then
    local _, _, subext, hygen_ext = string.find(filename, '.*%.(%a+)(%.%a+)')

    if subext == nil or hygen_ext ~= '.hygen' then
      return devicons.get_icon_color(filename, extension)
    end

    local _, icon_color = devicons.get_icon_color('name.hygen', 'hygen')
    local icon = devicons.get_icon('name.' .. subext, subext)

    return icon, icon_color
  else
    return devicons.get_icon_color(filename, extension)
  end
end

return { get_icon = get_icon }
