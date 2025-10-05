vim.g.mkdp_theme = 'dark'

local config = function()
  local utils = require('utils')
  local nmap = utils.nmap
  local map_notify = utils.map_notify

  nmap('<leader>mo', function()
    map_notify('Opening Markdown preview...')
    vim.cmd('MarkdownPreview')
  end)

  nmap('<leader>mc', function()
    vim.cmd('MarkdownPreviewStop')
    map_notify('Closed Markdown preview')
  end)
end

return {
  'iamcco/markdown-preview.nvim',
  -- TODO: inject bash if not starts with ":"
  -- injection vim if starts with ":"
  build = 'cd app && yarn install',
  config = config,
  ft = 'markdown',
}
