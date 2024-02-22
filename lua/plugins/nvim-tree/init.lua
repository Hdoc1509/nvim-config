local config = function()
  local nmap = require('utils').nmap
  local icons = require('icons')
  local attach = require('plugins.nvim-tree.attach')

  require('nvim-tree').setup({
    filters = {
      custom = {
        '^.git$',
      },
      exclude = {
        '*.local',
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info,
        warning = icons.diagnostics.Warn,
        error = icons.diagnostics.Error,
      },
    },
    renderer = {
      add_trailing = true,
      icons = {
        glyphs = {
          git = icons.git,
        },
      },
    },
    view = {
      number = true,
      relativenumber = true,
    },
    git = {
      ignore = false,
    },
    on_attach = attach,
  })

  nmap('<F1>', '<cmd>NvimTreeFindFileToggle<CR>')
  nmap('<F2>', '<cmd>NvimTreeToggle<CR>')
end

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
      opts = {
        override_by_extension = {
          ['http'] = {
            icon = '󰖟',
            color = '#228be6',
            name = 'Http',
          },
        },
      },
    },
  },
  config = config,
}
