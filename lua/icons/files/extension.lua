local COLORS = require('colors')

---@type table<string, FileIconConfig>
return {
  astro = { icon = '', color = COLORS['deep-purple-A200'], name = 'Astro' },
  -- TODO: add color to COLORS file: cyan-gray-900
  jq = { icon = '', color = '#4D5A5E', name = 'JQ' },
  cmd = { icon = '', color = '#c1f12e', name = 'CMD' },
}
