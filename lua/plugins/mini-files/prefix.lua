local devicons = require('nvim-web-devicons')
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

  local devicon_icon, devicon_hl = devicons.get_icon(name, nil, { default = false })

  icon = (icons.file[name] or {}).icon or devicon_icon or ''
  hl = (icons.file[name] or {}).hl or devicon_hl or 'MiniFilesFile'

  return icon .. ' ', hl
end

return M
