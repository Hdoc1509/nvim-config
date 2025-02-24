local get_icon_color = require('nvim-web-devicons').get_icon_color
local COLORS = require('colors')

local EnvIcon, EnvColor = get_icon_color('.env', 'env')
local GitIcon, GitColor = get_icon_color('.gitignore', 'gitignore')
local LicenseIcon, LicenseColor = get_icon_color('.license', 'license')

---@type table<string, FileIconConfig>
return {
  -- TODO: extend based on:
  -- https://github.com/material-extensions/vscode-material-icon-theme/blob/main/src/core/icons/fileIcons.ts

  -- NOTE: it's not necessary to use uppercase for file names

  env = {
    icon = EnvIcon,
    color = EnvColor,
    name = 'Env',
    file_names = {
      '.dev.vars',
      '.env.alpha',
      '.env.defaults',
      '.env.dev',
      '.env.dev.local',
      '.env.development',
      '.env.development.local',
      '.env.dist',
      '.env.e2e',
      '.env.example',
      '.env.local',
      '.env.preview',
      '.env.prod',
      '.env.prod.local',
      '.env.production',
      '.env.production.local',
      '.env.qa',
      '.env.qa.local',
      '.env.sample',
      '.env.schema',
      '.env.stage',
      '.env.staging',
      '.env.staging.local',
      '.env.stg',
      '.env.stg.local',
      '.env.template',
      '.env.test',
      '.env.test.local',
      '.env.testing',
      '.env.uat',
      '.vars',
    },
  },
  ['fabric.mod.json'] = {
    icon = '󰯁',
    color = COLORS['amber-A700'],
    name = 'FabricMod',
  },
  git = {
    icon = GitIcon,
    color = GitColor,
    name = 'Git',
    file_names = {
      '.git-blame-ignore',
      '.git-for-windows-updater',
      '.gitattributes-global',
      '.gitattributes_global',
      '.gitignore-global',
      '.gitignore_global',
      '.gitinclude',
      '.gitkeep',
      '.gitmessage',
      '.gitpreserve',
      '.keep',
      'git-history',
    },
  },
  license = {
    icon = LicenseIcon,
    color = LicenseColor,
    name = 'License',
    file_names = {
      'copying.md',
      'copying.rst',
      'copying.txt',
      'copyright',
      'copyright.md',
      'copyright.rst',
      'copyright.txt',
      'licence',
      'licence-agpl',
      'licence-apache',
      'licence-bsd',
      'licence-gpl',
      'licence-lgpl',
      'licence-mit',
      'licence.md',
      'licence.rst',
      'licence.txt',
      'license-agpl',
      'license-apache',
      'license-bsd',
      'license-gpl',
      'license-lgpl',
      'license-mit',
      'license.rst',
      'license.txt',
      'unlicense.txt',
    },
  },
  pnpm = {
    icon = '',
    color = '#FFB300',
    name = 'Pnpm',
    file_names = { 'pnpm-lock.yaml', 'pnpm-workspace.yaml' },
  },
  todo = {
    icon = '',
    -- TODO: add to COLORS file: orange-gray-500
    color = '#DBD0B4',
    name = 'Todo',
    file_names = { 'todo.md', 'todos.md' },
  },
  vite = {
    icon = '',
    color = COLORS['amber-A700'],
    name = 'Vite',
    file_names = { 'vite.config.js', 'vite.config.ts' },
  },
}
