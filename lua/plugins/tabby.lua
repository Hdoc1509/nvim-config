local config = function()
  local theme = {
    fill = { bg = '#101010', fg = '#8a8a8a' },
    current_tab = { bg = '#222222' },
  }

  local devicons = require('nvim-web-devicons')

  require('tabby').setup({
    line = function(line)
      return {
        line.tabs().foreach(function(tab)
          local is_current = tab.is_current()
          local hl = is_current and theme.current_tab or theme.fill
          local window = tab.current_win()
          local buf_name = window.buf_name()
          local extension = vim.fn.fnamemodify(buf_name, ':e')
          local icon, icon_color = devicons.get_icon_color(buf_name, extension)

          return {
            ' ',
            tab.number(),
            ' ',
            {
              icon,
              hl = { fg = icon_color, bg = hl.bg },
            },
            ' ',
            buf_name, -- no number of windows in tab
            -- tab.name(),
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
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = config,
}
