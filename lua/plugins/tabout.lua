return {
  'abecodes/tabout.nvim',
  lazy = false,
  event = 'InsertCharPre',
  priority = 1000,
  dependencies = {
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter',
  },
  config = true,
}
