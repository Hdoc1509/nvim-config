local config = function()
  local nmap = require('utils').nmap

  require('render-markdown').setup({
    heading = {
      icons = { '◉ ', '○ ', '✸ ', '✿ ' },
      sign = false,
      -- position = 'inline', FIX: breaks custom icons
      width = 'block',
      min_width = 79,
    },
    code = {
      -- position = 'left', FIX: not working
      sign = false,
      width = 'block',
      below = '',
    },
  })

  -- TODO: remove keymap
  nmap('<leader>mt', '<cmd>RenderMarkdown toggle<cr>', { desc = 'Toggle Markdown renderer' })
end

return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = config,
}
