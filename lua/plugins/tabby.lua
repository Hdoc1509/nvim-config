local config = function()
  local theme = {
    fill = { bg = '#101010', fg = '#8a8a8a' },
    current_tab = { bg = '#222222' },
  }

  local hygen_compatible = require('icons.hygen-compatible')

  require('tabby').setup({
    line = function(line)
      return {
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.fill
          local filename = tab.current_win().buf_name()
          local icon, icon_color = hygen_compatible.get_icon(filename)

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
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = config,
}
