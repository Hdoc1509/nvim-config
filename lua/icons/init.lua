local folder_icons = require('icons.folder')
local COLORS = require('colors')

return {
  diagnostics = {
    Error = '',
    Warn = '',
    Hint = '󰌶',
    Info = '',
  },
  git = {
    unstaged = 'M',
    staged = '➜',
    untracked = '?',
  },
  ---@type table<string, FolderIconConfig>
  directory = folder_icons,
  -- NOTE: only add icon and/or colors to files that do not have one yet
  -- TODO: do the same config used for folder icons
  -- add these to `nvim-web-devicons` register
  file = {
    name = {
      -- TODO: continue from here
      ['tsconfig.node.json'] = '', -- color of DevIconTSConfig highlight group
      ['.eslintrc.js'] = '', -- color of DevIconEslintrc highlight group
      ['.eslintrc.cjs'] = '',
      ['.eslintrc.mts'] = '',
      ['.eslintrc.cts'] = '',
      ['jsconfig.json'] = '', -- color of DevIconJs highlight group
      ['astro.config.cjs'] = '', -- color of DevIconAstro highlight groupº
      ['astro.config.cts'] = '',
      ['astro.config.js'] = '',
      ['astro.config.mjs'] = '',
      ['astro.config.mts'] = '',
      ['astro.config.ts'] = '',
      ['TODO.md'] = '',
    },
    ---@type table<string, FileIconConfig>
    extension = {
      astro = { icon = '', color = COLORS['deep-purple-A200'], name = 'Astro' },
      -- TODO: add color to COLORS file: cyan-gray-900
      jq = { icon = '', color = '#4D5A5E', name = 'JQ' },
    },
  },
}
