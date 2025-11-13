return {
  'mistweaverco/kulala.nvim',
  config = function()
    local kulala = require('kulala')
    local nmap = require('utils').nmap

    nmap('<leader>rr', kulala.run, { desc = 'Run request' })
    nmap('<leader>ra', kulala.run_all, { desc = 'Run all requests' })
    nmap('<leader>rl', kulala.replay, { desc = 'Run last request' })
    nmap('<leader>rb', kulala.scratchpad, { desc = 'Open scratchpad' })

    kulala.setup()
  end,
  keys = {
    { '<leader>rr', nil, desc = 'Run request' },
    { '<leader>ra', nil, desc = 'Run all requests' },
    { '<leader>rl', nil, desc = 'Run last request' },
    { '<leader>rb', nil, desc = 'Open scratchpad' },
  },
  ft = { 'http', 'rest' },
  version = '5.3.3',
}
