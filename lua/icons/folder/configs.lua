---@class (exact) FolderIconConfig
---@field icon? string
---@field hl string | { clone: string }
---@field folder_names? string[]

---@type table<string, FolderIconConfig>
return {
  -- TODO: extend based on:
  -- https://github.com/material-extensions/vscode-material-icon-theme/blob/5a653d98f2a1bb7ee7aae28a78c60ef21c911fd0/src/core/icons/folderIcons.ts
  ['.github'] = { icon = '', hl = 'FolderGithub' },
  config = { icon = '󱁿', hl = { clone = 'src' } },
  development = {
    icon = '󱧼',
    hl = 'FolderDevelopment',
    folder_names = { 'dev', 'development' },
  },
  home = { hl = { clone = 'development' } },
  other = { hl = 'FolderVideo' },
  src = {
    icon = '󰴉',
    hl = 'FolderSrc',
    folder_names = { 'code', 'source', 'sources', 'src', 'srcs' },
  },
  temp = {
    icon = '󰪺',
    hl = 'FolderTemp',
    folder_names = { '.cache', 'cache', 'cached', 'temp', 'tmp' },
  },
  utils = {
    icon = '󰉗',
    hl = 'FolderUtils',
    folder_names = { 'utilities', 'utils', 'utitlity' },
  },
}
