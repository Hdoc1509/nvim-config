local utils = require('utils')

local nmap = utils.nmap
local keymap = utils.keymap

-- Save and quit files
nmap('<Leader>w', '<cmd>update<CR>', { desc = 'Save file' })
nmap('<Leader>q', '<cmd>xit<CR>', { desc = 'Close file' })
nmap('<Leader>Q', '<cmd>quitall!<CR>', { desc = 'Close Neovim' })

-- Manipulate tabs
nmap('<Leader>tq', '<cmd>tabclose<CR>', { desc = 'Close tab' })
nmap('<Leader>to', '<cmd>tabonly<CR>', { desc = 'Close all other tabs' })
nmap('<Leader>th', '<cmd>tabmove -1<CR>', { desc = 'Move tab to left' })
nmap('<Leader>tl', '<cmd>tabmove +1<CR>', { desc = 'Move tab to right' })
nmap('<Leader>tj', '<cmd>tabprevious<CR>', { desc = 'Jump to previous tab' })
nmap('<Leader>tk', '<cmd>tabnext<CR>', { desc = 'Jump to next tab' })

-- Scrolling
nmap('<Leader>j', '10<C-e>', { desc = 'Scroll down 10 lines' })
nmap('<Leader>J', '20<C-e>', { desc = 'Scroll down 20 lines' })
nmap('<Leader>k', '10<C-y>', { desc = 'Scroll up 10 lines' })
nmap('<Leader>K', '20<C-y>', { desc = 'Scrool up 20 lines' })

-- Split resize
nmap('<Leader>>', '10<C-w>>', { desc = 'Resize split 10 pixels to left' })
nmap('<Leader><', ' 10<C-w><', { desc = 'Resize split 10 pixels to right' })

-- Split navigation
nmap('<C-h>', '<C-w>h', { desc = 'Jump to left split' })
nmap('<C-j>', '<C-w>j', { desc = 'Jump to bottom split' })
nmap('<C-k>', '<C-w>k', { desc = 'Jump to top split' })
nmap('<C-l>', '<C-w>l', { desc = 'Jump to right split' })
nmap('<Leader>h', '<C-w>h', { desc = 'Jump to left split' })
nmap('<Leader>l', '<C-w>l', { desc = 'Jump to right split' })

nmap('<Leader>chh', '<cmd>checkhealth<CR>', { desc = 'Run :checkhealth' })

-- Word case
keymap({ 'i', 'n' }, '<C-u>', '<cmd>normal g~iwe<CR>', { desc = 'Toggle word case' })
keymap({ 'i', 'n' }, '<C-t>', '<cmd>normal viwb~e<CR>', { desc = 'Toggle word title case' })

-- Delete line
keymap({ 'i', 'n' }, '<C-d>', '<cmd>normal dd<CR>', { desc = 'Delete current line' })

-- Indent and keep selection
keymap('x', '<', '<gv')
keymap('x', '>', '>gv')

-- Open URL under cursor
nmap(
  'gx',
  [[:silent execute '!' . g:browser . ' ' . shellescape(expand('<cfile>'), 1)<CR>]],
  { desc = 'Open URl under cursor' }
)

-- Search highlighing
nmap('<Leader>/', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlighing' })

-- Help in vertical split
keymap('c', 'vh', 'vertical help', { desc = 'Open help in vertical split' })

nmap('<Leader>sv', function()
  vim.cmd('source $MYVIMRC')
  vim.notify('Neovim config succesfully reloaded!', 'info')
end)

-- Copy to clipboard all text
nmap('<Leader>ya', '<cmd>%yank<CR>')

-- Add blankline below current line
nmap('<Leader>o', "printf('m`%so<ESC>``', v:count1)", { expr = true })

-- Add blankline above current line
nmap('<Leader>O', "printf('m`%sO<ESC>``', v:count1)", { expr = true })
