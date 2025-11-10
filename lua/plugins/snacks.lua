return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    words = {
      modes = {},
    },
    dim = {
      animate = { enabled = false },
    },
    -- FIX: breaks vim.lsp.buf.code_action()
    -- picker = {},
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
    {
      '<leader>Z',
      function()
        if not Snacks.dim.enabled then
          Snacks.dim()
        else
          Snacks.dim.disable()
        end
      end,
      desc = 'Focus the active scope',
    },
  },
}
