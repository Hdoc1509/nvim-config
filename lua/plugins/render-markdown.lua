local config = function()
  local nmap = require('utils').nmap

  require('render-markdown').setup({
    headings = { '◉ ', '○ ', '✸ ', '✿ ' },
  })

  nmap('<leader>mt', '<cmd>RenderMarkdownToggle<cr>', { desc = 'Toggle Markdown renderer' })
end

return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = config,
}
