local hygen_devicons = require('hygen.web-devicons')
local icons = require('icons')
local icon_file_utils = require('icons.files.utils')

return function(fs_entry)
  local name = fs_entry.name

  if fs_entry.fs_type == 'directory' then
    local icon = (icons.directory[name] or {}).icon or ''
    local hl = (icons.directory[name] or {}).hl or 'MiniFilesDirectory'

    return icon .. ' ', hl
  end

  local extension = vim.fn.fnamemodify(name, ':e')

  if extension == '' then
    local icon, _, hl = icon_file_utils.get_icon_without_extension(fs_entry.path)
    return icon .. ' ', hl
  else
    local icon, _, hl = hygen_devicons.get_icon(name)
    return icon .. ' ', hl
  end
end
