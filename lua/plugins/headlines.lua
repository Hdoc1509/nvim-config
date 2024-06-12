local config = function()
  require('headlines').setup({
    markdown = {
      headline_highlights = { 'Headline1', 'Headline2' },
    },
  })
  vim.cmd([[highlight link Headline1 DiffAdd]])
  vim.cmd([[highlight link Headline2 DiffChange]])
  vim.cmd([[highlight CodeBlock guibg=#0c0c0c]])
  vim.cmd([[highlight Dash guifg=#005c95]])
end

return {
  'lukas-reineke/headlines.nvim',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = config,
  enabled = false,
}
