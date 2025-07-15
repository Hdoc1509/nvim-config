local COLORS = require('colors')

---@type table<string, FileIconConfig>
return {
  astro = { icon = '', color = COLORS['deep-purple-A200'], name = 'Astro' },
  -- TODO: add color to COLORS file: cyan-gray-900
  jq = { icon = '', color = '#4D5A5E', name = 'JQ' },
  cmd = { icon = '', color = '#c1f12e', name = 'CMD' },
  gyp = { icon = '', color = '#ffbc03', name = 'GYP' },
  mcmeta = { icon = '󰍳', color = COLORS['green-500'], name = 'MCMeta' },
  jar = { icon = '', color = '#cc3e44', name = 'JAR' },
  ignore = { icon = '', color = '#6d8086', name = 'Ignore' },
  conf = { icon = '', color = COLORS['blue-400'], name = 'Conf' },
}
