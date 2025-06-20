local config = function()
  local helpers = require('incline.helpers')
  local devicons = require('nvim-web-devicons')
  ---@diagnostic disable-next-line: undefined-field
  local diagnostic_icons = require('icons').diagnostics
  local lightline_palette = vim.fn['lightline#palette']()

  require('incline').setup({
    window = {
      padding = 0,
      margin = { horizontal = 0 },
    },
    hide = {
      only_win = true,
    },
    render = function(props)
      local is_focused = props.focused
      local file_fg = ''
      local file_bg = ''

      local function get_diagnostic_label()
        local label = {}

        for severity, icon in pairs(diagnostic_icons) do
          local severityOption = vim.diagnostic.severity[string.upper(severity)]
          local quantity = #vim.diagnostic.get(props.buf, { severity = severityOption })

          if quantity > 0 then
            table.insert(label, {
              ' ' .. icon .. ' ' .. quantity,
              group = 'DiagnosticSign' .. severity,
            })
          end
        end

        if #label > 0 then
          table.insert(label, ' ')
        end

        return label
      end

      if not is_focused then
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

      ---@diagnostic disable-next-line: undefined-field
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
        { get_diagnostic_label() },
        ft_icon and {
          ' ',
          ft_icon,
          ' ',
          guibg = is_focused and ft_color or file_bg,
          guifg = is_focused and helpers.contrast_color(ft_color) or file_fg,
        } or '',
        {
          ' ' .. filename .. ' ',
          gui = modified and 'bold,italic' or 'bold',
          guibg = file_bg,
          guifg = file_fg,
        },
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
