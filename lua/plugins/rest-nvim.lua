local config = function()
  local nmap = require('utils').nmap
  local rest_nvim = require('rest-nvim')

  rest_nvim.setup()

  nmap('<Leader>rr', rest_nvim.run, { desc = 'Run http request under cursor' })
  nmap('<Leader>rl', rest_nvim.last, { desc = 'Run last http request' })
end

return {
  'rest-nvim/rest.nvim',
  -- NOTE: Follow https://github.com/rest-nvim/rest.nvim/issues/306
  commit = '91badd46c60df6bd9800c809056af2d80d33da4c',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = config,
}
