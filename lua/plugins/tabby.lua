local theme = {
  fill = 'TabLineFill',
  current_tab = 'TabLineSel',
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
