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
    ['.env.local'] = '', -- color of DevIconEnv highlight group
    ['.env.production'] = '',
    ['.env.development'] = '',
    ['.env.example'] = '',
    ['TODO.md'] = '',
    ['fabric.mod.json'] = '󰯁',
    ['vite.config.js'] = '',
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
  file_extension = {
    jq = '', -- color of DevIconSh
  }
}
