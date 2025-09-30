local config = function()
  local theme = {
    fill = { bg = '#101010', fg = '#8a8a8a' },
    current_tab = { bg = '#222222' },
  }

  local hygen_devicons = require('hygen.web-devicons')
  local icon_file_utils = require('icons.files.utils')

  require('tabby').setup({
    line = function(line)
      return {
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.fill
          local win = tab.current_win()
          local filename = win.buf_name()
          local ext = vim.fn.fnamemodify(filename, ':e')
          local icon, icon_color = '', ''

          if ext == '' then
            icon, icon_color = icon_file_utils.get_icon_without_extension(win.buf().id)
          else
            icon, icon_color = hygen_devicons.get_icon(filename)
          end

          return {
            ' ',
            tab.number(),
            ' ',
            {
              icon,
              hl = { fg = icon_color, bg = hl.bg },
            },
            ' ',
            filename,
            hl = hl,
            ' ',
          }
        end),
        line.spacer(),
        hl = theme.fill,
      }
    end,
  })
end

return {
  'nanozuki/tabby.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- { dir = '~/dev/nvim-plugins/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', version = '*' },
    { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
  },
  config = config,
}
