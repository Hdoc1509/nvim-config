---@module 'snacks'

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
    -- TODO: try gh module
    -- https://github.com/folke/snacks.nvim/blob/main/docs/gh.md
    picker = {},
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
  version = '^2.30.0',
}
