---@class (exact) FolderIconConfig
---@field icon? string
---@field hl string | { clone: string }
---@field folder_names? string[]

---@type table<string, FolderIconConfig>
return {
  -- NOTE: use folder-shaped icons
  -- icons based on mini.icons and vscode-material-icon-theme

  -- TODO: extend based on:
  -- https://github.com/material-extensions/vscode-material-icon-theme/blob/5a653d98f2a1bb7ee7aae28a78c60ef21c911fd0/src/core/icons/folderIcons.ts
  -- Folder-prefixed highlight groups colors should come from:
  -- https://github.com/material-extensions/vscode-material-icon-theme/blob/5a653d98f2a1bb7ee7aae28a78c60ef21c911fd0/material-colors.yml

  ['.changeset'] = { hl = 'FolderChangesets' },
  ['.idea'] = { hl = 'FolderIntellij' },
  ['.local'] = { icon = '󰉌', hl = 'FolderLocal' },
  ['.vim'] = { hl = 'DevIconVim' },
  ['.vscode'] = { hl = 'FolderVscode' },
  api = {
    icon = '󰴉',
    hl = 'FolderApi',
    folder_names = { 'api', 'apis', 'restapi' },
  },
  AppData = { icon = '󰉌', hl = 'FolderOther' },
  app = {
    icon = '󱧺',
    hl = 'FolderApp',
    folder_names = { 'Applications', 'app', 'application', 'applications', 'apps' },
  },
  archive = {
    icon = '󰪺',
    hl = 'FolderArchive',
    folder_names = {
      'arc',
      'arcs',
      'archive',
      'archives',
      'archival',
      'bkp',
      'bkps',
      'bak',
      'baks',
      'backup',
      'backups',
      'back-up',
      'back-ups',
      'history',
      'histories',
    },
  },
  astro = { hl = 'DevIconAstro', folder_names = { '.astro', 'astro' } },
  audio = {
    icon = '󱍙',
    hl = 'FolderAudio',
    folder_names = {
      'Music',
      'aud',
      'audio',
      'audios',
      'auds',
      'music',
      'recordings',
      'sound',
      'sounds',
      'voice',
      'voices',
    },
  },
  bin = { icon = '󱧺', hl = 'FolderDist', folder_names = { '.bin', 'bin', 'sbin' } },
  boot = { icon = '󰴋', hl = 'FolderBoot' },
  c = { hl = 'DevIconC' },
  cinnamon = {
    hl = 'DevIconCinnamon',
    folder_names = { 'cinnamon', 'cinnamon-session' },
  },
  class = {
    icon = '󱧶',
    hl = 'FolderClass',
    folder_names = {
      'class',
      'classes',
      'model',
      'models',
      'schema',
      'schemas',
    },
  },
  client = {
    hl = 'FolderClient',
    folder_names = {
      'client',
      'clients',
      'frontend',
      'frontends',
      'pwa',
      'spa',
    },
  },
  config = {
    icon = '󱁿',
    hl = 'FolderConfig',
    folder_names = {
      '.config',
      '.settings',
      'after',
      'cfg',
      'cfgs',
      'conf',
      'config',
      'configs',
      'configuration',
      'configurations',
      'confs',
      'META-INF',
      'option',
      'options',
      'pref',
      'preference',
      'preferences',
      'prefs',
      'setting',
      'settings',
    },
  },
  connection = {
    hl = 'FolderConnection',
    folder_names = {
      'connection',
      'connections',
      'integration',
      'integrations',
      'remote',
      'remotes',
    },
  },
  content = {
    icon = '󰲂',
    hl = 'FolderContent',
    folder_names = { 'content', 'contents' },
  },
  controller = {
    icon = '󱁿',
    hl = 'FolderController',
    folder_names = {
      'controller',
      'controllers',
      'controls',
      'handler',
      'handlers',
      'provider',
      'providers',
      'service',
      'services',
      'srv',
    },
  },
  compiler = { icon = '󱁽', hl = 'DevIconVim' },
  components = {
    icon = '󱋣',
    hl = 'FolderComponents',
    folder_names = { 'components', 'fragmments', 'widget', 'widgets' },
  },
  css = {
    icon = '󰣞',
    hl = 'DevIconCss',
    folder_names = { 'css', 'style', 'styles', 'stylesheet', 'stylesheets' },
  },
  database = {
    icon = '󰉓',
    hl = 'FolderDatabase',
    folder_names = { 'data', 'database', 'databases', 'db', 'sql' },
  },
  desktop = {
    icon = '󰚝',
    hl = 'FolderDesktop',
    folder_names = { 'Desktop', 'desktop', 'display' },
  },
  development = {
    icon = '󱧼',
    hl = 'FolderDevelopment',
    folder_names = { 'dev', 'development' },
  },
  dist = {
    icon = '󱧼',
    hl = 'FolderDist',
    folder_names = {
      'build',
      'builds',
      'dist',
      'distribution',
      'out',
      'output',
      'Release',
      'release',
    },
  },
  Documents = { icon = '󱧶', hl = 'FolderDocs' },
  docs = {
    icon = '󱂷',
    hl = 'FolderDocs',
    folder_names = {
      'article',
      'articles',
      'doc',
      'docs',
      'document',
      'documentation',
      'documents',
      'news',
      'post',
      'posts',
      'wiki',
    },
  },
  download = {
    icon = '󰉍',
    hl = 'FolderDownload',
    folder_names = {
      'Downloads',
      'download',
      'downloader',
      'downloaders',
      'downloads',
    },
  },
  embedded_template = { icon = '󱋣', hl = 'DevIconEjs' },
  error = {
    icon = '󰷌',
    hl = 'FolderError',
    folder_names = { 'crash', 'crashes', 'err', 'error', 'errors', 'errs' },
  },
  etc = { icon = '󱁿', hl = 'FolderOther' },
  event = { icon = '󱞊', hl = 'FolderEvent', folder_names = { 'event', 'events' } },
  examples = {
    hl = 'FolderExamples',
    folder_names = {
      'demo',
      'demos',
      'example',
      'examples',
      'sample',
      'sample-data',
      'samples',
    },
  },
  Favorites = { icon = '󱃪', hl = 'FolderFavorites' },
  font = { hl = 'FolderFont', folder_names = { 'font', 'fonts' } },
  ftdetect = { icon = '󱁽', hl = 'DevIconVim' },
  functions = {
    icon = '󱁽',
    hl = 'FolderFunctions',
    folder_names = {
      'autoload',
      'calc',
      'calcs',
      'calculation',
      'calculations',
      'func',
      'funcs',
      'function',
      'functions',
      'lambda',
      'lambdas',
      'logic',
      'math',
      'maths',
    },
  },
  generator = {
    icon = '󰴋',
    hl = 'FolderGenerator',
    folder_names = {
      'auto',
      'cfn-gen',
      'gen',
      'generated',
      'generated-sources',
      'generator',
      'generators',
      'gens',
    },
  },
  github = { icon = '', hl = 'FolderGithub', folder_names = { '.github', 'gh' } },
  git = {
    icon = '',
    hl = 'DevIconGitLogo',
    folder_names = { '.git', 'git', 'githooks', 'patches', 'submodules' },
  },
  go = { hl = 'DevIconGo' },
  gradle = {
    hl = 'DevIconGradle',
    folder_names = { '.gradle', 'buildSrc', 'gradle' },
  },
  groovy = { hl = 'DevIconGroovy' },
  gtk = { hl = 'DevIconGtk', folder_names = { 'gtk-2.0', 'gtk-3.0', 'gtk-4.0' } },
  home = {
    icon = '󱂵',
    hl = 'FolderHome',
    folder_names = { 'home', 'landing', 'main', 'start' },
  },
  hook = {
    icon = '󱁿',
    hl = 'FolderHook',
    folder_names = { 'hook', 'hooks', 'trigger', 'triggers' },
  },
  html = { icon = '󱋣', hl = 'DevIconHtml' },
  i18n = {
    icon = '󱁽',
    hl = 'FolderI18n',
    folder_names = {
      'i18n',
      'internationalization',
      'l10n',
      'lang',
      'langs',
      'language',
      'languages',
      'locale',
      'locales',
      'localization',
      'translate',
      'translation',
      'translations',
      'tx',
    },
  },
  images = {
    icon = '󰉏',
    hl = 'FolderImages',
    folder_names = {
      '.icons',
      'fig',
      'figs',
      'figure',
      'figures',
      'ico',
      'icon',
      'icons',
      'icos',
      'image',
      'images',
      'img',
      'imgs',
      'photo',
      'photograph',
      'photographs',
      'photos',
      'pic',
      'pics',
      'picture',
      'Pictures',
      'pictures',
      'screengrab',
      'screengrabs',
      'screenshot',
      'screenshots',
    },
  },
  indent = { icon = '󱁽', hl = 'DevIconVim' },
  java = { hl = 'DevIconJava', folder_names = { '.java', 'java', 'jre' } },
  javascript = {
    hl = 'DevIconJs',
    folder_names = { 'ecma', 'javascript', 'javascripts', 'js' },
  },
  layout = {
    icon = '󱋣',
    hl = 'FolderLayout',
    folder_names = { 'layout', 'layouts' },
  },
  lib = {
    icon = '󰲂',
    hl = 'FolderLib',
    folder_names = {
      'Library',
      'lib',
      'lib64',
      'libraries',
      'library',
      'libs',
      'third-party',
      'vendor',
      'vendors',
    },
  },
  log = {
    icon = '󱂷',
    hl = 'FolderLog',
    folder_names = { 'log', 'logging', 'logs' },
  },
  lsp = { icon = '󱁽', hl = 'FolderLsp' },
  lua = { hl = 'DevIconLua' },
  mappings = {
    icon = '󱁽',
    hl = 'FolderMappings',
    folder_names = { 'keymap', 'mapping', 'mappings' },
  },
  markdown = { hl = 'DevIconMarkdown', folder_names = { 'markdown', 'md' } },
  media = { icon = '󱧺', hl = 'FolderVideo' },
  mnt = { icon = '󰉓', hl = 'FolderMnt' },
  mock = {
    icon = '󰣞',
    hl = 'FolderMock',
    folder_names = {
      'concept',
      'concepts',
      'draft',
      'drafts',
      'fixture',
      'fixtures',
      'mock',
      'mocks',
      'sketch',
      'sketches',
    },
  },
  netlify = { hl = 'FolderNetlify', folder_names = { '.netlify', 'netlify' } },
  node = {
    icon = '',
    hl = 'FolderNode',
    folder_names = { '.npm', 'node', 'node_modules', 'nodejs', 'npm' },
  },
  neovim = { hl = 'DevIconVim', folder_names = { 'neovim', 'nvim' } },
  opt = { icon = '󰉗', hl = 'FolderConfig' },
  other = {
    hl = 'FolderOther',
    folder_names = {
      'other',
      'others',
      'misc',
      'miscellaneous',
      'extra',
      'extras',
    },
  },
  packages = {
    icon = '󱁽',
    hl = 'FolderPackages',
    folder_names = {
      'dependencies',
      'devpackages',
      'pack',
      'package',
      'packages',
      'pkg',
      'pkgs',
      'serverpackages',
    },
  },
  parser = { icon = '󱁽', hl = 'DevIconVim' },
  plugin = {
    icon = '󱁽',
    hl = 'FolderPlugin',
    folder_names = {
      'addin',
      'addins',
      'addon',
      'addons',
      'extension',
      'extensions',
      'ftplugin',
      'mod',
      'modding',
      'mods',
      'module',
      'modules',
      'plugin',
      'plugins',
      'rplugin',
    },
  },
  -- TODO: rename highlight group to `DevIconPnpm` once I setted it for
  -- `nvim-web-devicons`
  pnpm = { hl = 'FolderPnpm' },
  proc = { icon = '󰢬', hl = 'FolderConfig' },
  ProgramData = { icon = '󰉌', hl = 'FolderOther' },
  public = {
    icon = '󱧰',
    hl = 'FolderPublic',
    folder_names = {
      'Public',
      'browser',
      'browsers',
      'public',
      'site',
      'web',
      'website',
      'websites',
      'www',
      'wwwroot',
    },
  },
  python = {
    hl = 'DevIconPy',
    folder_names = { 'pycache', 'pytest_cache', 'python' },
  },
  queries = { icon = '󱁽', hl = 'DevIconVim' },
  react = { hl = 'DevIconJsx' },
  resource = {
    icon = '󱧶',
    hl = 'FolderResource',
    folder_names = {
      'asset',
      'assets',
      'report',
      'reports',
      'res',
      'resource',
      'resources',
      'static',
    },
  },
  root = { icon = '󰷌', hl = 'FolderRoot' },
  rules = {
    icon = '󱥾',
    hl = 'FolderRules',
    folder_names = {
      'rules',
      'validation',
      'validations',
      'validator',
      'validators',
      'rule',
    },
  },
  run = { icon = '󱧺', hl = 'FolderHome' },
  rust = { hl = 'DevIconRs' },
  sass = {
    icon = '󰣞',
    hl = 'DevIconScss',
    folder_names = { 'sass', 'sass-utils', 'scss' },
  },
  scripts = {
    icon = '󰴉',
    hl = 'FolderScripts',
    folder_names = { 'script', 'scripting', 'scripts' },
  },
  secure = {
    icon = '󰉐',
    hl = 'FolderSecure',
    folder_names = {
      'auth',
      'authentication',
      'cert',
      'certificate',
      'certificates',
      'certs',
      'cipher',
      'cypher',
      'secure',
      'security',
      'ssl',
      'tls',
    },
  },
  server = {
    hl = 'FolderServer',
    folder_names = { 'backend', 'backends', 'server', 'servers', 'ssr' },
  },
  shared = {
    icon = '󰡰',
    hl = 'FolderShared',
    folder_names = { 'Network', 'common', 'shared' },
  },
  shell = { icon = '󰴉', hl = 'DevIconSh' },
  snippet = {
    icon = '󱁽',
    hl = 'FolderSnippets',
    folder_names = { 'snippet', 'snippets' },
  },
  src = {
    icon = '󰴉',
    hl = 'FolderSrc',
    folder_names = { 'code', 'source', 'sources', 'src', 'srcs' },
  },
  state = { hl = 'FolderState' },
  store = { icon = '󱂵', hl = 'FolderStore', folder_names = { 'store', 'stores' } },
  swift = { hl = 'DevIconSwift' },
  syntax = {
    icon = '󱥾',
    hl = 'FolderSyntax',
    folder_names = { 'spell', 'spellcheck', 'spellcheckers', 'syntax', 'syntaxes' },
  },
  System = { icon = '󱧼', hl = 'FolderOther' },
  temp = {
    icon = '󰪺',
    hl = 'FolderTemp',
    folder_names = { '.cache', 'cache', 'cached', 'temp', 'tmp' },
  },
  template = {
    icon = '󱋣',
    hl = 'FolderTemplate',
    folder_names = {
      '_templates',
      'ISSUE_TEMPLATE',
      'PULL_REQUEST_TEMPLATE',
      'Template',
      'template',
      'Templates',
      'templates',
    },
  },
  test = {
    icon = '󱞊',
    hl = 'FolderTest',
    folder_names = {
      'snapshots',
      'spec',
      'specs',
      'test',
      'testing',
      'tests',
    },
  },
  toml = { hl = 'DevIconToml' },
  theme = {
    icon = '󱁽',
    hl = 'FolderTheme',
    folder_names = {
      '.themes',
      'color',
      'colors',
      'design',
      'designs',
      'theme',
      'themes',
      'theming',
    },
  },
  trash = { icon = '󱧴', hl = 'FolderTrash', folder_names = { 'Trash', 'trash' } },
  tutor = { icon = '󱁽', hl = 'DevIconVim' },
  typescript = {
    hl = 'DevIconTypeScript',
    folder_names = { '@types', 'ts', 'types', 'typescript', 'typings' },
  },
  ui = {
    icon = '󱋣',
    hl = 'FolderUi',
    folder_names = { 'gui', 'presentation', 'ui', 'ux' },
  },
  user = { icon = '󰉌', hl = 'FolderOther', folder_names = { 'Users', 'usr' } },
  utils = {
    icon = '󰉗',
    hl = 'FolderUtils',
    folder_names = { 'utilities', 'utils', 'utitlity' },
  },
  var = { icon = '󱋣', hl = 'FolderOther' },
  video = {
    icon = '󱞊',
    hl = 'FolderVideo',
    folder_names = {
      'Videos',
      'movie',
      'movies',
      'vid',
      'video',
      'videos',
      'vids',
    },
  },
  views = {
    icon = '󱞊',
    hl = 'FolderViews',
    folder_names = {
      'page',
      'pages',
      'public_html',
      'screen',
      'screens',
      'view',
      'views',
    },
  },
  vite = {
    hl = 'FolderVite',
    folder_names = { '.vite', 'vite', 'vite-config', 'vitejs' },
  },
  vlc = { hl = 'DevIconVlc' },
  Volumes = { icon = '󰉓', hl = 'FolderOther' },
  windows = { hl = 'DevIconWindows', folder_names = { 'win', 'win32', 'windows' } },
  workflows = { hl = 'FolderGithub' },
  yaml = { hl = 'DevIconYaml' },
}
