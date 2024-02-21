local config = function()
  local theme = {
    fill = { fg = '#000000', bg = 'NONE' },
    current_tab = { fg = '#000000', bg = '#777777' },
    tab = 'TabLine',
    win = 'TabLine',
  }

  require('tabby.tabline').set(function(line)
    return {
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        local window = tab.current_win()

        return {
          '',
          tab.number(),
          window.file_icon(), -- icon of current window
          window.buf_name(), -- no number of windows in tab
          -- tab.name(),
          hl = hl,
          margin = ' ',
          '',
        }
      end),
      line.spacer(),
      hl = theme.fill,
    }
  end)
end

return {
  'nanozuki/tabby.nvim',
  config = config,
}
