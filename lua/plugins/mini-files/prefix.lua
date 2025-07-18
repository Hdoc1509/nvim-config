local hygen_devicons = require('hygen.web-devicons')
local icons = require('icons')

return function(fs_entry)
  local name = fs_entry.name

  if fs_entry.fs_type == 'directory' then
    local icon = (icons.directory[name] or {}).icon or ''
    local hl = (icons.directory[name] or {}).hl or 'MiniFilesDirectory'

    return icon .. ' ', hl
  end

  local icon, _, hl = hygen_devicons.get_icon(name)
  return icon .. ' ', hl
end
