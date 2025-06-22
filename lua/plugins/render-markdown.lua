local config = function()
  require('render-markdown').setup({
    heading = {
      icons = { '◉ ', '○ ', '✸ ', '✿ ' },
      sign = false,
      width = 'block',
      min_width = 79,
      -- FIX: breaks custom icons. works from nvim-0.10
      -- position = 'inline',
    },
    -- NOTE: I won't need this option once updated to nvim-0.10
    pipe_table = {
      cell = 'overlay',
    },
    code = {
      sign = false,
      width = 'block',
      below = '',
      language_border = '',
    },
  })
end

return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = config,
}
