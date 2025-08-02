local COLORS = require('colors')

-- NOTE: extend based on:
-- https://github.com/material-extensions/vscode-material-icon-theme/blob/main/src/core/icons/fileIcons.ts
-- it's not necessary to use uppercase for file names

---@param base_icons BaseIcons
local function generate(base_icons)
  local tsconfig = base_icons.filename['tsconfig.json']
  local ext = {
    sh = base_icons.extension.sh,
    query = base_icons.extension.query,
    conf = base_icons.extension.conf,
  }

  ---@type table<string, FileIconConfig>
  return {
    ['.dircolors'] = {
      icon = ext.conf.icon,
      color = ext.sh.color,
      name = 'Dircolors',
    },
    ['.minttyrc'] = {
      icon = ext.conf.icon,
      color = ext.sh.color,
      name = 'Minttyrc',
    },
    ['.neoconf.json'] = {
      icon = '',
      color = base_icons.extension.vim.color,
      name = 'Neoconf',
    },
    -- color: https://packwiz.infra.link/
    -- `--md-primary-fg-color`
    ['.packwizignore'] = { icon = '', color = '#ab47bd', name = 'PackwizIgnore' },
    ['.profile'] = {
      icon = ext.conf.icon,
      color = ext.sh.color,
      name = 'Profile',
    },
    -- color: https://github.com/sdkman/sdkman.github.io/blob/main/static/assets/img/bubble-logo-sdkman-groovy-color.svg
    ['.sdkmanrc'] = { icon = ext.conf.icon, color = '#FB2127', name = 'SDKMANRC' },
    ['.shellcheckrc'] = {
      icon = '',
      color = ext.sh.color,
      name = 'Shellcheckrc',
    },
    ['.tsqueryrc.json'] = {
      icon = ext.conf.icon,
      color = ext.query.color,
      name = 'TSQueryRc',
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
    ['cargo.lock'] = {
      icon = '',
      color = COLORS['amber-300'],
      name = 'CargoLock',
    },
    ['cargo.toml'] = {
      icon = '',
      color = base_icons.extension.rs.color,
      name = 'CargoToml',
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
    contributing = {
      icon = '󰅍',
      color = COLORS['amber-400'],
      name = 'Contributing',
      file_names = {
        'contributing',
        'contributing.md',
        'contributing.rst',
        'contributing.txt',
      },
    },
    eclipse_metadata = {
      icon = '',
      -- color: https://eclipseide.org/
      -- .btn-primary { background-color };
      color = '#f89521',
      name = 'EclipseMetadata',
      file_names = { '.project', '.classpath', '.settings', '.factorypath' },
    },
    env = {
      icon = base_icons.filename['.env'].icon,
      color = base_icons.filename['.env'].color,
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
      icon = base_icons.filename['.eslintrc'].icon,
      color = base_icons.filename['.eslintrc'].color,
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
      icon = base_icons.extension.git.icon,
      color = base_icons.filename['.gitignore'].color,
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
      icon = base_icons.extension.go.icon,
      color = COLORS['pink-400'],
      name = 'GoMod',
    },
    ['jsconfig.json'] = {
      icon = '',
      color = base_icons.extension.js.color,
      name = 'Jsconfig',
    },
    -- color: https://github.com/folke/lazy.nvim/blob/docs/static/img/icon.svg
    ['lazy-lock.json'] = { icon = '󰒲', name = 'LazyLock', color = '#2e7de9' },
    license = {
      icon = base_icons.filename.license.icon,
      color = base_icons.filename.license.color,
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
    -- color: https://www.curseforge.com/
    -- .btn-primary { background-color };
    ['mods.toml'] = { icon = '󰢛', color = '#f16436', name = 'ModsToml' },
    ['netlify.toml'] = {
      icon = '',
      color = COLORS['teal-400'],
      name = 'NetlifyToml',
    },
    ['nx.json'] = {
      icon = ext.conf.icon,
      color = COLORS['light-blue-600'],
      name = 'NXJson',
    },
    ['package.json'] = {
      icon = '󰎙',
      color = base_icons.filename['.nvmrc'].color,
      name = 'PackageJson',
    },
    ['package-lock.json'] = {
      icon = base_icons.filename['.npmrc'].icon,
      color = base_icons.filename['.npmrc'].color,
      name = 'PackageLockJson',
    },
    ['playwright.config.js'] = {
      icon = base_icons.extension.js.icon,
      color = COLORS['green-500'],
      name = 'PlaywrightConfigJS',
    },
    ['playwright.config.ts'] = {
      icon = base_icons.extension.ts.icon,
      color = COLORS['green-500'],
      name = 'PlaywrightConfigTS',
    },
    pnpm = {
      icon = '',
      color = COLORS['amber-600'],
      name = 'Pnpm',
      file_names = { 'pnpm-lock.yaml', 'pnpm-workspace.yaml', '.pnpmfile.cjs' },
    },
    ['pyproject.toml'] = {
      icon = base_icons.extension.py.icon,
      color = base_icons.extension.toml.color,
      name = 'PyProjectToml',
    },
    query = {
      icon = ext.query.icon,
      color = ext.query.color,
      name = 'TreeSitterQuery',
      file_names = {
        'folds.scm',
        'highlights.scm',
        'indents.scm',
        'injections.scm',
        'locals.scm',
      },
    },
    stylua = {
      icon = '󰗈',
      color = base_icons.extension.lua.color,
      name = 'Stylua',
      file_names = { '.stylua.toml', '.styluaignore', 'stylua.toml' },
    },
    todo = {
      icon = '',
      color = COLORS['light-green-600'],
      name = 'Todo',
      file_names = { 'todo.md', 'todos.md' },
    },
    ['tree-sitter.json'] = {
      icon = ext.conf.icon,
      color = ext.query.color,
      name = 'TreeSitterJson',
    },
    ['tsconfig.app.json'] = {
      icon = tsconfig.icon,
      color = tsconfig.color,
      name = 'TSConfigApp',
      file_names = { 'tsconfig.app.base.json', 'tsconfig.app.json' },
    },
    ['tsconfig.app.react.json'] = {
      icon = tsconfig.icon,
      color = base_icons.extension.jsx.color,
      name = 'TSConfigAppReact',
    },
    ['tsconfig.node.json'] = {
      icon = tsconfig.icon,
      color = base_icons.filename['.nvmrc'].color,
      name = 'TSConfigNode',
    },
    typosconfig_lsp = {
      icon = '󰛓',
      color = COLORS['red-400'],
      name = 'TyposConfigLsp',
      file_names = { '.typos.toml', '_typos.toml', 'typos.toml' },
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
end

return { generate = generate }
