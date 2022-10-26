local cmd = vim.cmd
local keymap = vim.keymap.set

local opts = { silent = true, noremap = true }
local map_notify = function(message)
  vim.notify(message, 'info', {
    title = 'Mapping',
  })
end

-- Edit config file
keymap('n', '<Leader>sv', function()
  map_notify('Sourcing $MYVIMRC file...')
  cmd('source $MYVIMRC')
end, opts)

keymap('n', '<Leader>sf', function()
  map_notify('Sourcing current file...')
  cmd('source %')
end, opts)

-- Copy to clipboard all text
keymap({ 'n', 'i' }, '<C-a>', function()
  cmd('%yank')
  map_notify('Yanked all text')
end, opts)

-- MarkdownPreview
keymap('n', '<Leader>mp', function()
  map_notify('Opening Markdown preview...')
  cmd('MarkdownPreview')
end, opts)

keymap('n', '<Leader>mps', function()
  cmd('MarkdownPreviewStop')
  map_notify('Closed Markdown preview')
end, opts)

-- Formatter
keymap('n', '<Leader>f', function()
  map_notify('Formatting...')
  cmd('Format')
end, opts)

keymap('n', '<Leader>fw', function()
  map_notify('Formatting and writing...')
  cmd('FormatWrite')
end, opts)
