local utils = require('utils')

local nmap = utils.nmap
local keymap = utils.keymap

-- Save and quit files
nmap('<leader>w', '<cmd>update ++p<cr>', { desc = 'Save file' })
nmap('<leader>W', '<cmd>wall<cr>', { desc = 'Save all files' })
nmap('<leader>q', '<cmd>xit<cr>', { desc = 'Save and close file' })
nmap('<leader>Q', '<cmd>xall<cr>', { desc = 'Save all files and close Neovim' })

-- Manipulate tabs
nmap('<leader>tq', '<cmd>tabclose<cr>', { desc = 'Close tab' })
nmap('<leader>to', '<cmd>tabonly<cr>', { desc = 'Close all other tabs' })
nmap('<leader>th', '<cmd>tabmove -1<cr>', { desc = 'Move tab to left' })
nmap('<leader>tH', '<cmd>tabmove 0<cr>', { desc = 'Move tab to first position' })
nmap('<leader>tl', '<cmd>tabmove +1<cr>', { desc = 'Move tab to right' })
nmap('<leader>tL', '<cmd>tabmove $<cr>', { desc = 'Move tab to last position' })

-- Navigate trough tabs
nmap('<leader>tj', '<cmd>tabprevious<cr>', { desc = 'Jump to previous tab' })
nmap('<leader>tJ', '<cmd>tabfirst<cr>', { desc = 'Jump to first tab' })
nmap('<leader>tk', '<cmd>tabnext<cr>', { desc = 'Jump to next tab' })
nmap('<leader>tK', '<cmd>tablast<cr>', { desc = 'Jump to last tab' })

-- Jump to tags
nmap('<leader>[', '<c-w>]', { desc = 'jump to tag under cursor in a split' })
nmap('<leader>]', '<c-w>]<c-w>T', { desc = 'Jump to tag under cursor in a new tab' })

-- Scrolling
keymap({ 'n', 'x' }, '<leader>j', '10<c-e>', { desc = 'Scroll down 10 lines' })
keymap({ 'n', 'x' }, '<leader>J', '20<c-e>', { desc = 'Scroll down 20 lines' })
keymap({ 'n', 'x' }, '<leader>k', '10<c-y>', { desc = 'Scroll up 10 lines' })
keymap({ 'n', 'x' }, '<leader>K', '20<c-y>', { desc = 'Scrool up 20 lines' })
nmap('<leader>sb', '<cmd>windo set scrollbind!<cr>', { desc = 'Toggle scrollbind in windows of current tab' })

-- Split resize
nmap('<leader>>', '10<c-w>>', { desc = 'Resize split 10 pixels to left' })
nmap('<leader><', ' 10<c-w><', { desc = 'Resize split 10 pixels to right' })

-- Split navigation
nmap('<c-h>', '<c-w>h', { desc = 'Jump to left split' })
nmap('<c-j>', '<c-w>j', { desc = 'Jump to bottom split' })
nmap('<c-k>', '<c-w>k', { desc = 'Jump to top split' })
nmap('<c-l>', '<c-w>l', { desc = 'Jump to right split' })

-- Move windows trough tabs
nmap('<leader>H', utils.move_window_to_prev_tab, { desc = 'Move current window to previous tab' })
nmap('<leader>L', utils.move_window_to_next_tab, { desc = 'Move current window to next tab' })

nmap('<leader>chh', '<cmd>checkhealth<cr>', { desc = 'Run :checkhealth' })

-- Word case
keymap({ 'i', 'n' }, '<c-u>', '<cmd>normal g~iwe<cr>', { desc = 'Toggle word case' })
keymap({ 'i', 'n' }, '<c-t>', '<cmd>normal viwb~e<cr>', { desc = 'Toggle word title case' })

-- Delete line
keymap({ 'i', 'n' }, '<c-d>', '<cmd>normal dd<cr>', { desc = 'Delete current line' })

-- Indent and keep selection
keymap('x', '<', '<gv')
keymap('x', '>', '>gv')

-- Search highlighing
nmap('<leader>/', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlighing' })

-- Help in vertical split
keymap('c', 'vh', 'vertical help', { desc = 'Open help in vertical split' })
-- Help in new tab
keymap('c', 'th', 'tab help', { desc = 'Open help in new tab' })

-- Copy to clipboard all text
nmap('<leader>ya', '<cmd>%yank<cr>')

-- Add blankline below current line
nmap('<leader>o', "printf('m`%so<esc>``', v:count1)", { expr = true })

-- Add blankline above current line
nmap('<leader>O', "printf('m`%so<esc>``', v:count1)", { expr = true })

-- Toggle spell check
keymap({ 'i', 'n' }, '<F3>', '<cmd>set spell!<cr>', { desc = 'Toggle spell check', silent = false })

nmap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
nmap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
nmap('<leader>dl', vim.diagnostic.setqflist, { desc = 'Show all diagnostics on quickfix list' })

-- Replace all matches of selected text
keymap(
  'x',
  '<leader>r',
  'y:%s/<c-r>0/replace/gc<left><left><left><c-w>',
  { desc = 'Replace selected text in current file' }
)
keymap(
  'x',
  '<leader>R',
  'y:vimgrep /<c-r>0/ ** | copen |cdo %s/<c-r>0/replace/gc<left><left><left><c-w>',
  { desc = 'Replace selected text in all files' }
)

-- Lazy
nmap('<leader>lr', '<cmd>Lazy reload <tab>', { desc = 'Reload a plugin' })
