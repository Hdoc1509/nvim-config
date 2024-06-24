local utils = require('utils')

local nmap = utils.nmap
local keymap = utils.keymap

-- Save and quit files
nmap('<Leader>w', '<cmd>update<CR>', { desc = 'Save file' })
nmap('<Leader>W', '<cmd>wall<CR>', { desc = 'Save all files' })
nmap('<Leader>q', '<cmd>xit<CR>', { desc = 'Save and close file' })
nmap('<Leader>Q', '<cmd>quitall!<CR>', { desc = 'Close Neovim' })

-- Manipulate tabs
nmap('<Leader>tq', '<cmd>tabclose<CR>', { desc = 'Close tab' })
nmap('<Leader>to', '<cmd>tabonly<CR>', { desc = 'Close all other tabs' })
nmap('<Leader>th', '<cmd>tabmove -1<CR>', { desc = 'Move tab to left' })
nmap('<Leader>tH', '<cmd>tabmove 0<CR>', { desc = 'Move tab to first position' })
nmap('<Leader>tl', '<cmd>tabmove +1<CR>', { desc = 'Move tab to right' })
nmap('<Leader>tL', '<cmd>tabmove $<CR>', { desc = 'Move tab to last position' })

-- Navigate trough tabs
nmap('<Leader>tj', '<cmd>tabprevious<CR>', { desc = 'Jump to previous tab' })
nmap('<Leader>tJ', '<cmd>tabfirst<CR>', { desc = 'Jump to first tab' })
nmap('<Leader>tk', '<cmd>tabnext<CR>', { desc = 'Jump to next tab' })
nmap('<Leader>tK', '<cmd>tablast<CR>', { desc = 'Jump to last tab' })

-- Jump to tags
nmap('<Leader>[', '<C-w>]', { desc = 'Jump to tag under cursor in a split' })
nmap('<Leader>]', '<C-w>]<C-w>T', { desc = 'Jump to tag under cursor in a new tab' })

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

-- Move windows trough tabs
nmap('<Leader>H', utils.move_window_to_prev_tab, { desc = 'Move current window to previous tab' })
nmap('<Leader>L', utils.move_window_to_next_tab, { desc = 'Move current window to next tab' })

nmap('<Leader>chh', '<cmd>checkhealth<CR>', { desc = 'Run :checkhealth' })

-- Word case
keymap({ 'i', 'n' }, '<C-u>', '<cmd>normal g~iwe<CR>', { desc = 'Toggle word case' })
keymap({ 'i', 'n' }, '<C-t>', '<cmd>normal viwb~e<CR>', { desc = 'Toggle word title case' })

-- Delete line
keymap({ 'i', 'n' }, '<C-d>', '<cmd>normal dd<CR>', { desc = 'Delete current line' })

-- Indent and keep selection
keymap('x', '<', '<gv')
keymap('x', '>', '>gv')

-- Search highlighing
nmap('<Leader>/', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlighing' })

-- Help in vertical split
keymap('c', 'vh', 'vertical help', { desc = 'Open help in vertical split' })
-- Help in new tab
keymap('c', 'th', 'tab help', { desc = 'Open help in new tab' })

-- Copy to clipboard all text
nmap('<Leader>ya', '<cmd>%yank<CR>')

-- Add blankline below current line
nmap('<Leader>o', "printf('m`%so<ESC>``', v:count1)", { expr = true })

-- Add blankline above current line
nmap('<Leader>O', "printf('m`%sO<ESC>``', v:count1)", { expr = true })

-- Toggle spell check
keymap({ 'i', 'n' }, '<F3>', '<cmd>set spell!<CR>', { desc = 'Toggle spell check', silent = false })

nmap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
nmap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
nmap('<Leader>dl', vim.diagnostic.setqflist, { desc = 'Show all diagnostics on quickfix list' })

-- Rplace all matches of selected text
keymap('x', '<Leader>r', 'y:s/<C-R>0/replace/g<Left><Left><C-W>', { desc = 'Replace selected text in current line' })
keymap('x', '<Leader>R', 'y:%s/<C-R>0/replace/g<Left><Left><C-W>', { desc = 'Replace selected text in current file' })
