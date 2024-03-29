return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('render-markdown').setup({
      headings = { '◉ ', '○ ', '✸ ', '✿ ' },
    })
    require('utils').nmap('<Leader>mt', '<cmd>RenderMarkdownToggle<CR>')
  end,
}
