local COLORS = require('colors')

---@type table<string, FileIconConfig>
return {
  -- TODO: extend based on:
  -- https://github.com/material-extensions/vscode-material-icon-theme/blob/main/src/core/icons/fileIcons.ts

  -- NOTE: it's not necessary to use uppercase for file names

  ['.sdkmanrc'] = {
    icon = '',
    -- https://github.com/sdkman/sdkman.github.io/blob/main/static/assets/img/bubble-logo-sdkman-groovy-color.svg
    color = '#FB2127',
    name = 'SDKMANRC',
  },
  astro_config = {
    icon = '',
    color = COLORS['deep-purple-A200'],
    name = 'AstroConfig',
    file_names = {
      'astro.config.cjs',
      'astro.config.cts',
      'astro.config.js',
      'astro.config.mjs',
      'astro.config.mts',
      'astro.config.ts',
    },
  },
  changelog = {
    icon = '',
    color = COLORS['light-green-500'],
    name = 'Changelog',
    file_names = {
      'changelog',
      'changelog.md',
      'changelog.rst',
      'changelog.txt',
      'changes',
      'changes.md',
      'changes.rst',
      'changes.txt',
    },
  },
  eclipse_metadata = {
    icon = '',
    color = '#f89521', -- from eclipseide.org
    name = 'EclipseMetadata',
    file_names = { '.project', '.classpath', '.settings', '.factorypath' },
  },
  env = {
    icon = '',
    color = '#faf743',
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
  eslintrc = {
    icon = '',
    color = '#4b32c3',
    name = 'Eslintrc',
    file_names = {
      '.eslintrc.cjs',
      '.eslintrc.cts',
      '.eslintrc.js',
      '.eslintrc.mts',
    },
  },
  ['fabric.mod.json'] = {
    icon = '󰯁',
    color = COLORS['amber-A700'],
    name = 'FabricMod',
  },
  git = {
    icon = '',
    color = '#f54d27',
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
  ['go.mod'] = {
    icon = '',
    color = COLORS['pink-400'],
    name = 'GoMod',
  },
  ['jsconfig.json'] = {
    icon = '',
    name = 'Jsconfig',
    color = '#cbcb41',
  },
  ['lazy-lock.json'] = {
    icon = '󰒲',
    name = 'LazyLock',
    -- from: https://github.com/folke/lazy.nvim/blob/docs/static/img/icon.svg
    color = '#2e7de9',
  },
  license = {
    icon = '',
    color = '#cbcb41',
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
  ['mods.toml'] = {
    icon = '󰢛',
    color = '#f16436',
    name = 'ModsToml',
  },
  ['netlify.toml'] = {
    icon = '',
    color = COLORS['teal-400'],
    name = 'NetlifyToml',
  },
  ['nx.json'] = {
    icon = '',
    color = COLORS['light-blue-600'],
    name = 'NXJson',
  },
  ['playwright.config.js'] = {
    icon = '',
    color = COLORS['green-500'],
    name = 'PlaywrightConfigJS',
  },
  ['playwright.config.ts'] = {
    icon = '',
    color = COLORS['green-500'],
    name = 'PlaywrightConfigTS',
  },
  pnpm = {
    icon = '',
    color = COLORS['amber-600'],
    name = 'Pnpm',
    file_names = { 'pnpm-lock.yaml', 'pnpm-workspace.yaml', '.pnpmfile.cjs' },
  },
  query = {
    icon = '',
    color = '#90a850',
    name = 'TreeSitterQuery',
    file_names = {
      'folds.scm',
      'highlights.scm',
      'indents.scm',
      'injections.scm',
      'locals.scm',
    },
  },
  todo = {
    icon = '',
    color = COLORS['light-green-600'],
    name = 'Todo',
    file_names = { 'todo.md', 'todos.md' },
  },
  ['tree-sitter.json'] = {
    icon = '',
    color = '#90a850',
    name = 'TreeSitterJson',
  },
  ['tsconfig.app.json'] = {
    icon = '',
    color = '#519aba',
    name = 'TSConfigApp',
    file_names = { 'tsconfig.app.base.json', 'tsconfig.app.json' },
  },
  ['tsconfig.app.react.json'] = {
    icon = '',
    color = '#20c2e3',
    name = 'TSConfigAppReact',
  },
  ['tsconfig.node.json'] = {
    icon = '',
    color = '#5fa04e',
    name = 'TSConfigNode',
  },
  vite = {
    icon = '',
    color = COLORS['amber-A700'],
    name = 'Vite',
    file_names = { 'vite.config.js', 'vite.config.ts' },
  },
  vitest = {
    icon = '',
    color = COLORS['light-green-700'],
    name = 'Vitest',
    file_names = { 'vitest.config.js', 'vitest.config.ts' },
  },
}
