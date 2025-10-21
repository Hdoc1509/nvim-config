local config = function()
  local rest_nvim = require('rest-nvim')

  rest_nvim.setup()

  vim.keymap.set('n', '<leader>rr', rest_nvim.run, {
    desc = 'Run http request under cursor',
  })
  vim.keymap.set('n', '<leader>rl', rest_nvim.last, {
    desc = 'Run last http request',
  })
end

-- TODO: replace with `kulala.nvim` once updated to nvim-0.10

return {
  'rest-nvim/rest.nvim',
  commit = '91badd46c60df6bd9800c809056af2d80d33da4c',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = config,
  ft = 'http',
}
