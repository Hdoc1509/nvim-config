return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    input = {},
    words = {},
  },
  keys = {
    {
      ']r',
      function()
        Snacks.words.jump(1, true)
      end,
      desc = 'Got to next LSP reference',
    },
    {
      '[r',
      function()
        Snacks.words.jump(-1, true)
      end,
      desc = 'Got to previous LSP reference',
    },
  },
}
