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
  ---@type table<string, table<string, FolderIconConfig>>
  file = file_icons,
}
