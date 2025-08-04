local lightline_palette = vim.fn['lightline#palette']()

---@param props { mode: string, is_focused: boolean}
---@return string fg, string bg
return function(props)
  local mode = props.mode
  local fg, bg = '', ''

  if not props.is_focused then
    fg = lightline_palette.inactive.left[1][1]
    bg = lightline_palette.inactive.left[1][2]
  else
    if mode == 'command' or mode == 'terminal' then
      mode = 'normal'
    elseif mode == 'select' or mode:match('^[sv]%-') ~= nil then
      mode = 'visual'
    end

    fg = lightline_palette[mode].left[1][1]
    bg = lightline_palette[mode].left[1][2]
  end

  return fg, bg
end
