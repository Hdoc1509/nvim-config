local config = function()
  require('headlines').setup({
    markdown = {
      headline_highlights = { 'Headline1', 'Headline2' },
    },
  })
  vim.cmd([[highlight Headline1 guibg=#151b11]])
  vim.cmd([[highlight Headline2 guibg=#161a1e]])
  vim.cmd([[highlight CodeBlock guibg=#0c0c0c]])
  vim.cmd([[highlight Dash guifg=#005c95]])
end

return {
  'lukas-reineke/headlines.nvim',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = config,
}
