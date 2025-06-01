local folder_icons = require('icons.folder')
local file_icons = require('icons.files')

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
  file = {
    ---@type table<string, FileIconConfig>
    name = file_icons.name,
    -- name = {
    --    TODO: continue from here
    --   ['tsconfig.node.json'] = '', -- color of DevIconTSConfig highlight group
    --   ['.eslintrc.js'] = '', -- color of DevIconEslintrc highlight group
    --   ['.eslintrc.cjs'] = '',
    --   ['.eslintrc.mts'] = '',
    --   ['.eslintrc.cts'] = '',
    --   ['jsconfig.json'] = '', -- color of DevIconJs highlight group
    --   ['astro.config.cjs'] = '', -- color of DevIconAstro highlight groupº
    --   ['astro.config.cts'] = '',
    --   ['astro.config.js'] = '',
    --   ['astro.config.mjs'] = '',
    --   ['astro.config.mts'] = '',
    --   ['astro.config.ts'] = '',
    --   ['TODO.md'] = '',
    -- },
    ---@type table<string, FileIconConfig>
    extension = file_icons.extension,
  },
}
