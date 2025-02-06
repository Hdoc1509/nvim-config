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
  -- get similar icons and colors from:
  -- https://raw.githubusercontent.com/material-extensions/vscode-material-icon-theme/main/images/fileIcons.png
  -- https://raw.githubusercontent.com/material-extensions/vscode-material-icon-theme/main/images/folderIcons.png

  -- NOTE: use folder-shaped icons
  -- if directory uses default icon, it's not necessary to add it here
  directory = {
    utils = { icon = '󰉗', hl = 'FolderUtils' },
    ['.cache'] = { icon = '󰪺', hl = 'FolderCyan' },
    ['.config'] = { icon = '󱁿', hl = 'FolderCyan' },
    ['.git'] = { icon = '', hl = 'FolderDeepOrange' },
    ['.github'] = { icon = '', hl = 'FolderGithub' },
    ['.local'] = { icon = '󰉌', hl = 'FolderCyan' },
    ['.vim'] = { hl = 'FolderGreen' },
    AppData = { icon = '󰉌', hl = 'FolderDeepOrange' },
    Applications = { icon = '󱧺', hl = 'FolderDeepOrange' },
    Desktop = { icon = '󰚝', hl = 'FolderDesktop' },
    Documents = { icon = '󱧶', hl = 'FolderDeepOrange' },
    Downloads = { icon = '󰉍', hl = 'FolderDownloads' },
    Favorites = { icon = '󱃪', hl = 'FolderDeepOrange' },
    Library = { icon = '󰲂', hl = 'FolderLibrary' },
    Music = { icon = '󱍙', hl = 'FolderMusic' },
    Network = { icon = '󰡰', hl = 'FolderDeepOrange' },
    Pictures = { icon = '󰉏', hl = 'FolderImages' },
    ProgramData = { icon = '󰉌', hl = 'FolderDeepOrange' },
    Public = { icon = '󱧰', hl = 'FolderPublic' },
    System = { icon = '󱧼', hl = 'FolderDeepOrange' },
    Templates = { icon = '󱋣', hl = 'FolderTemplate' },
    Template = { icon = '󱋣', hl = 'FolderTemplate' },
    Trash = { icon = '󱧴', hl = 'FolderTrash' },
    Users = { icon = '󰉌', hl = 'FolderDeepOrange' },
    -- vid, vids, vide, movie, movies
    Videos = { icon = '󱞊', hl = 'FolderVideo' },
    Volumes = { icon = '󰉓', hl = 'FolderDeepOrange' },
    autoload = { icon = '󱁽', hl = 'FolderGreen' },
    bin = { icon = '󱧺', hl = 'FolderDist' },
    build = { icon = '󱧼', hl = 'FolderDist' },
    boot = { icon = '󰴋', hl = 'FolderBoot' },
    -- themes, theme, color, design, designs
    colors = { icon = '󱁽', hl = 'FolderTheme' },
    compiler = { icon = '󱁽', hl = 'FolderGreen' },
    -- development
    dev = { icon = '󱧼', hl = 'FolderDevelopment' },
    -- docs, document, documents, documentation, post, posts, article, articles,
    -- wiki, news
    doc = { icon = '󱂷', hl = 'FolderDocs' },
    -- default icon: other, others, misc, miscellaneous, extra, extras
    -- same highlight group as 'etc'
    etc = { icon = '󱁿', hl = 'FolderDeepOrange' },
    ftdetect = { icon = '󱁽', hl = 'FolderGreen' },
    ftplugin = { icon = '󱁽', hl = 'FolderGreen' },
    -- start, main, landing
    home = { icon = '󱂵', hl = 'FolderHome' },
    -- indent = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- keymap = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- lang = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- lib = { glyph = '󰲂', hl = 'MiniIconsYellow' },
    -- lsp = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- lua = { glyph = '󰉋', hl = 'MiniIconsBlue' },
    -- media = { glyph = '󱧺', hl = 'MiniIconsYellow' },
    -- mnt = { glyph = '󰉓', hl = 'MiniIconsYellow' },
    -- ['mini.nvim'] = { glyph = '󰚝', hl = 'MiniIconsRed' },
    -- node_modules = { glyph = '', hl = 'MiniIconsGreen' },
    -- nvim = { glyph = '󰉋', hl = 'MiniIconsGreen' },
    -- opt = { glyph = '󰉗', hl = 'MiniIconsYellow' },
    -- pack = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- parser = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- plugin = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- proc = { glyph = '󰢬', hl = 'MiniIconsYellow' },
    -- queries = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- rplugin = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- root = { glyph = '󰷌', hl = 'MiniIconsYellow' },
    -- sbin = { glyph = '󱧺', hl = 'MiniIconsYellow' },
    -- spell = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- src = { glyph = '󰴉', hl = 'MiniIconsPurple' },
    -- srv = { glyph = '󱋣', hl = 'MiniIconsYellow' },
    -- snippets = { glyph = '󱁽', hl = 'MiniIconsYellow' },
    -- syntax = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- tmp = { glyph = '󰪺', hl = 'MiniIconsYellow' },
    -- test = { glyph = '󱞊', hl = 'MiniIconsBlue' },
    -- tests = { glyph = '󱞊', hl = 'MiniIconsBlue' },
    -- tutor = { glyph = '󱁽', hl = 'MiniIconsGreen' },
    -- usr = { glyph = '󰉌', hl = 'MiniIconsYellow' },
    -- var = { glyph = '󱋣', hl = 'MiniIconsYellow' },
  },
  -- NOTE: only add icon and/or colors to files that do not have one yet
  file = {
    ['TODO.md'] = '󰝖',
  },
}
