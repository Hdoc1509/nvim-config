---@class (exact) FolderIconConfig
---@field icon? string
---@field hl string | { clone: string }
---@field folder_names? string[]

---@type table<string, FolderIconConfig>
return {
  -- TODO: extend based on:
  -- https://github.com/material-extensions/vscode-material-icon-theme/blob/5a653d98f2a1bb7ee7aae28a78c60ef21c911fd0/src/core/icons/folderIcons.ts
  utils = {
    icon = '󰉗',
    hl = 'FolderUtils',
    folder_names = { 'utils', 'utitlity', 'utilities' },
  },
  temp = {
    icon = '󰪺',
    hl = 'FolderTemp',
    folder_names = { 'temp', 'tmp', 'cached', 'cache', '.cache' },
  },
  development = {
    icon = '󱧼',
    hl = 'FolderDevelopment',
    folder_names = { 'dev', 'development' },
  },
  src = {
    icon = '󰴉',
    hl = 'FolderSrc',
    folder_names = { 'src', 'srcs', 'source', 'sources', 'code' },
  },
  ['.github'] = { icon = '', hl = 'FolderGithub' },
  config = { icon = '󱁿', hl = { clone = 'src' } },
  other = { hl = 'FolderVideo' },
  home = { hl = { clone = 'development' } },
}
