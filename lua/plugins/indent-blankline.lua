vim.opt.list = true
vim.opt.listchars = 'trail:·'

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = { char = '│' },
    scope = { enabled = false },
  },
}
