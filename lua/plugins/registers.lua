return {
  'tversteeg/registers.nvim',
  opts = {},
  cmd = 'Registers',
  keys = {
    { '"', mode = { 'n', 'v' } },
    { '<c-r>', mode = 'i' },
  },
}
