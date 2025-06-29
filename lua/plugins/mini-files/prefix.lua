local hygen_compatible = require('icons.hygen-compatible')
local icons = require('icons')

return function(fs_entry)
  local name = fs_entry.name

  if fs_entry.fs_type == 'directory' then
    local icon = (icons.directory[name] or {}).icon or ''
    local hl = (icons.directory[name] or {}).hl or 'MiniFilesDirectory'

    return icon .. ' ', hl
  end

  local extension = vim.fn.fnamemodify(name, ':e')

  if extension == 'hygen' then
    return hygen_compatible.get_icon(name) .. ' ', 'DevIconHygen'
  else
    return MiniFiles.default_prefix(fs_entry)
  end
end
