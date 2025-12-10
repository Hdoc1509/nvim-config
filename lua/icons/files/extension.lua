local COLORS = require('colors')

---@param base_icons BaseIcons
local function generate(base_icons)
  local ext = { conf = base_icons.extension.conf }

  ---@type table<string, FileIconConfig>
  return {
    astro = { icon = '', color = COLORS['deep-purple-A200'], name = 'Astro' },
    jq = {
      icon = base_icons.extension.sh.icon,
      color = base_icons.extension.sh.color,
      name = 'JQ',
    },
    cmd = {
      icon = base_icons.os.windows.icon,
      color = base_icons.os.windows.color,
      name = 'CMD',
    },
    gyp = {
      icon = base_icons.extension.py.icon,
      color = base_icons.extension.py.color,
      name = 'GYP',
    },
    mcmeta = { icon = '󰍳', color = COLORS['green-500'], name = 'MCMeta' },
    jar = {
      icon = base_icons.extension.java.icon,
      color = base_icons.extension.java.color,
      name = 'JAR',
    },
    ignore = { icon = ext.conf.icon, color = ext.conf.color, name = 'Ignore' },
    conf = { icon = ext.conf.icon, color = COLORS['blue-400'], name = 'Conf' },
    vms = { icon = '󰾹', color = '#8cb6ff', name = 'VimMapSide' },
  }
end

return { generate = generate }
