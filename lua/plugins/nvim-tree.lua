local config = function()
  local nmap = require('utils').nmap
  local api = require('nvim-tree.api')

  local open_tab_silent = function(node)
    api.node.open.tab(node)
    vim.cmd('tabprev | NvimTreeOpen')
  end

  ---@type function
  local open_drop = api.node.open.drop

  local on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)

    nmap('h', api.node.navigate.parent_close, { desc = 'Close directory', buffer = bufnr })
    nmap('l', open_drop, { desc = 'Open', buffer = bufnr })
    nmap('T', open_tab_silent, { desc = 'Open in tab silent', buffer = bufnr })
    nmap('<CR>', open_drop, { desc = 'Open', buffer = bufnr })
  end

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
    renderer = {
      add_trailing = true,
      icons = {
        glyphs = {
          git = {
            unstaged = 'M',
            staged = '➜',
            untracked = '?',
          },
        },
        --git_placement = 'signcolumn',
      },
    },
    view = {
      number = true,
      relativenumber = true,
    },
    git = {
      ignore = false,
    },
    on_attach = on_attach,
  })

  nmap('<F1>', '<cmd>NvimTreeFindFileToggle<CR>')
  nmap('<F2>', '<cmd>NvimTreeToggle<CR>')
end

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = config
}
