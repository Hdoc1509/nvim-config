return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    heading = {
      icons = { '◉ ', '○ ', '✸ ', '✿ ' },
      sign = false,
      -- position = 'inline', FIX: breaks custom icons. works from nvim-0.10
      width = 'block',
      min_width = 79,
    },
    code = {
      -- position = 'left', FIX: not working. works from nvim-0.10
      sign = false,
      width = 'block',
      below = '',
    },
  },
}
