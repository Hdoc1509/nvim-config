local icons = require('icons')

local M = {}

M.custom_prefix = function(fs_entry)
  local name = fs_entry.name
  local icon = ''
  local hl = ''

  if fs_entry.fs_type == 'directory' then
    icon = (icons.directory[name] or {}).icon or ''
    hl = (icons.directory[name] or {}).hl or 'MiniFilesDirectory'

    return icon .. ' ', hl
  end

  return MiniFiles.default_prefix(fs_entry)
end

return M
