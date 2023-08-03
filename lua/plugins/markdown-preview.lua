vim.g.mkdp_theme = 'dark'

local config = function()
  local utils = require('utils')
  local nmap = utils.nmap
  local map_notify = utils.map_notify

  nmap('<Leader>mo', function()
    map_notify('Opening Markdown preview...')
    vim.cmd('MarkdownPreview')
  end)

  nmap('<Leader>mc', function()
    vim.cmd('MarkdownPreviewStop')
    map_notify('Closed Markdown preview')
  end)
end

return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && yarn install',
  config = config,
  ft = 'markdown',
}
