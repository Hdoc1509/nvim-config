local config = function()
  local helpers = require('incline.helpers')
  local devicons = require('nvim-web-devicons')
  local lightline_palette = vim.fn['lightline#palette']()

  require('incline').setup({
    window = {
      padding = 0,
      margin = { horizontal = 0 },
    },
    render = function(props)
      local file_fg = ''
      local file_bg = ''

      if not props.focused then
        file_fg = lightline_palette.inactive.left[1][1]
        file_bg = lightline_palette.inactive.left[1][2]
      else
        local mode = string.lower(vim.fn['lightline#mode']())

        if mode == 'command' or mode == 'terminal' then
          mode = 'normal'
        elseif mode == 'select' or string.match(mode, '^[sv]%-') ~= nil then
          mode = 'visual'
        end

        file_fg = lightline_palette[mode].left[1][1]
        file_bg = lightline_palette[mode].left[1][2]
      end

      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')

      if filename == '' then
        filename = '[No Name]'
      end

      local ft_icon, ft_color = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified

      if modified then
        filename = filename .. ' +'
      end

      return {
        ft_icon and {
          ' ',
          ft_icon,
          ' ',
          guibg = ft_color,
          guifg = helpers.contrast_color(ft_color),
        } or '',
        ' ',
        { filename, gui = modified and 'bold,italic' or 'bold' },
        ' ',
        guibg = file_bg,
        guifg = file_fg,
      }
    end,
  })
end

return {
  'b0o/incline.nvim',
  dependencies = {
    'itchyny/lightline.vim',
  },
  config = config,
  event = 'VeryLazy',
}
