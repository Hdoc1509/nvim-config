local config = function()
  local tabby_win_name = require('tabby.feature.win_name')
  local helpers = require('incline.helpers')
  local hygen_devicons = require('hygen.web-devicons')
  local diagnostic_icons = require('icons').diagnostics
  local lightline_palette = vim.fn['lightline#palette']()
  local last_diagnostic_label = {}

  require('incline').setup({
    window = {
      padding = 0,
      margin = { horizontal = 0 },
    },
    hide = { cursorline = 'focused_win' },
    ignore = {
      filetypes = { 'gitcommit', 'qf', 'gitrebase' },
    },
    render = function(props)
      local mode = string.lower(vim.fn['lightline#mode']())
      local is_focused = props.focused
      local file_fg = ''
      local file_bg = ''

      local function get_diagnostic_label()
        if mode == 'insert' then
          return last_diagnostic_label
        end

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

        last_diagnostic_label = label
        return label
      end

      if not is_focused then
        file_fg = lightline_palette.inactive.left[1][1]
        file_bg = lightline_palette.inactive.left[1][2]
      else
        if mode == 'command' or mode == 'terminal' then
          mode = 'normal'
        elseif mode == 'select' or string.match(mode, '^[sv]%-') ~= nil then
          mode = 'visual'
        end

        file_fg = lightline_palette[mode].left[1][1]
        file_bg = lightline_palette[mode].left[1][2]
      end

      local filename = tabby_win_name.get(props.win, { mode = 'unique' })
      local icon, icon_color = hygen_devicons.get_icon(filename)
      local modified = vim.bo[props.buf].modified

      if modified then
        filename = filename .. ' +'
      end

      return {
        { get_diagnostic_label() },
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
    end,
  })
end

return {
  'b0o/incline.nvim',
  dependencies = {
    'itchyny/lightline.vim',
    'nvim-tree/nvim-web-devicons',
    'nanozuki/tabby.nvim',
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', version = '*' },
  },
  config = config,
  event = 'VeryLazy',
}
