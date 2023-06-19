local nmap = require("utils").nmap
local api = require("nvim-tree.api")

-- Automatically open file upon creation
api.events.subscribe(api.events.Event.FileCreated, function (file)
  vim.cmd('edit ' .. file.fname)
end)

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
})

nmap('<F1>', '<cmd>NvimTreeFindFileToggle<CR>')
