local tabby_win_name = require('tabby.feature.win_name')
local helpers = require('incline.helpers')
local hygen_devicons = require('hygen.web-devicons')
local get_diagnostic_label = require('plugins.incline.diagnostic-label')
local get_file_label_colors = require('plugins.incline.file-label-colors')
local icon_file_utils = require('icons.files.utils')

---@param props { buf: number, win: number, focused: boolean }
return function(props)
  local filename = tabby_win_name.get(props.win, { mode = 'unique' })
  local mode = string.lower(vim.fn['lightline#mode']())
  local is_focused = props.focused
  local file_fg, file_bg = get_file_label_colors({
    mode = mode,
    is_focused = is_focused,
  })

  local ext = vim.fn.fnamemodify(filename, ':e')
  local icon, icon_color = '', ''

  if ext == '' then
    icon, icon_color = icon_file_utils.get_icon_without_extension(props.buf)
  else
    icon, icon_color = hygen_devicons.get_icon(filename)
  end

  local modified = vim.bo[props.buf].modified

  if modified then
    filename = filename .. ' +'
  end

  return {
    { get_diagnostic_label({ mode = mode, bufnr = props.buf }) },
    icon and {
      ' ',
      icon,
      ' ',
      guibg = is_focused and icon_color or file_bg,
      guifg = is_focused and helpers.contrast_color(icon_color) or file_fg,
    } or '',
    {
      ' ' .. filename .. ' ',
      gui = modified and 'bold,italic' or 'bold',
      guibg = file_bg,
      guifg = file_fg,
    },
  }
end
