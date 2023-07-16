local utils = require("utils")
local nmap = utils.nmap
local map_notify = utils.map_notify

vim.g.mkdp_theme = 'dark'

nmap('<Leader>mo', function()
  map_notify('Opening Markdown preview...')
  vim.cmd('MarkdownPreview')
end)

nmap('<Leader>mc', function()
  vim.cmd('MarkdownPreviewStop')
  map_notify('Closed Markdown preview')
end)
