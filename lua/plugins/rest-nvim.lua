local nmap = require('utils').nmap
local rest_nvim = require('rest-nvim')

rest_nvim.setup()

nmap('<Leader>rr', rest_nvim.run, { desc = 'Run http request under cursor' })
nmap('<Leader>rl', rest_nvim.last, { desc = 'Run last http request' })
