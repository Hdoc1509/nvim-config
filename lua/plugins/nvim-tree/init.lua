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
      group_empty = true,
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

  nmap('<F1>', '<cmd>NvimTreeFindFileToggle<cr>')
  nmap('<F2>', '<cmd>NvimTreeToggle<cr>')
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
    },
  },
  config = config,
}
