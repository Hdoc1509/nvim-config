local nmap = require('utils').nmap
local tab_map_util = require('utils.tabs')

-- manipulation
nmap('<leader>tq', '<cmd>tabclose<cr>', { desc = 'Close tab' })
nmap('<leader>to', '<cmd>tabonly<cr>', { desc = 'Close all other tabs' })
nmap('<leader>th', function()
  tab_map_util.use_previous_tabs({
    onExceed = function()
      vim.cmd('tabmove 0')
    end,
    onAvailable = function(quantity)
      vim.cmd('tabmove -' .. quantity)
    end,
  })
end, { desc = 'Move tab to left' })
nmap('<leader>tH', '<cmd>tabmove 0<cr>', { desc = 'Move tab to first position' })
nmap('<leader>tl', function()
  tab_map_util.use_next_tabs({
    onExceed = function()
      vim.cmd('tabmove $')
    end,
    onAvailable = function(quantity)
      vim.cmd('tabmove +' .. quantity)
    end,
  })
end, { desc = 'Move tab to right' })
nmap('<leader>tL', '<cmd>tabmove $<cr>', { desc = 'Move tab to last position' })
nmap('<leader>tn', '<cmd>tabnew<cr>', { desc = 'Open a new empty tab' })

-- navigation
nmap('<leader>tj', function()
  tab_map_util.use_previous_tabs({
    onExceed = function()
      vim.cmd('tabfirst')
    end,
    onAvailable = function(quantity)
      vim.cmd('tabprevious ' .. quantity)
    end,
  })
end, { desc = 'Go to previous tab(s)' })
nmap('<leader>tJ', '<cmd>tabfirst<cr>', { desc = 'Go to first tab' })
nmap('<leader>tk', function()
  tab_map_util.use_next_tabs({
    onExceed = function()
      vim.cmd('tablast')
    end,
    onAvailable = function(quantity)
      vim.cmd('tabnext +' .. quantity)
    end,
  })
end, { desc = 'Go to next tab(s)' })
nmap('<leader>tK', '<cmd>tablast<cr>', { desc = 'Go to last tab' })
nmap('<leader>tt', 'g<tab>', { desc = 'Go to last accessed tab' })
