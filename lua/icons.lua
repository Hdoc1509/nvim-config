local folder_icons = require('icons.folder')

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
  directory = folder_icons,
  -- NOTE: only add icon and/or colors to files that do not have one yet
  -- TODO: do the same config used for folder icons
  -- add these to `nvim-web-devicons` register
  file = {
    ['TODO.md'] = '',
    ['fabric.mod.json'] = '󰯁',
    ['vite.config.js'] = '',
    ['vite.config.ts'] = '',
    ['pnpm-lock.yaml'] = '',
    ['pnpm-workspace.yaml'] = '',
  },
}
