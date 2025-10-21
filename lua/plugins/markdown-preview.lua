vim.g.mkdp_theme = 'dark'

local config = function()
  local utils = require('utils')

  utils.nmap('<leader>mo', function()
    utils.map_notify('Opening Markdown preview...')
    vim.cmd('MarkdownPreview')
  end)

  utils.nmap('<leader>mc', function()
    vim.cmd('MarkdownPreviewStop')
    utils.map_notify('Closed Markdown preview')
  end)
end

return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && yarn install',
  config = config,
  ft = 'markdown',
}
