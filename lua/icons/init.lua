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
      -- local IconEnv, ColorEnv require('nvim-web-devicons').get_icon_color(".env", "env")
      ['.env.local'] = '', -- color of DevIconEnv highlight group
      ['.env.production'] = '',
      ['.env.development'] = '',
      ['.env.example'] = '',
      ['TODO.md'] = '',
      ['fabric.mod.json'] = '󰯁', -- #DBD0B4
      ['vite.config.js'] = '', --- COLORS['amber-A700']
      ['vite.config.ts'] = '',
      ['pnpm-lock.yaml'] = '', -- color of DevIconPnpm highlight group
      ['pnpm-workspace.yaml'] = '',
      ['.git-for-windows-updater'] = '', -- color of DevIconGitAttributes highlight group
      ['LICENSE.txt'] = '', -- color of DevIconLicense highlight group
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
    },
    ---@type table<string, FileIconConfig>
    extension = {
      astro = { icon = '', color = COLORS['deep-purple-A200'], name = 'Astro' },
      -- TODO: add color to COLORS files
      jq = { icon = '', color = '#4d5a5e', name = 'JQ' },
    },
  },
}
