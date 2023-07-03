local nmap = require("utils").nmap
local nvim_ufo = require('ufo')

nvim_ufo.setup({
  open_fold_hl_timeout = 0,
})

nmap('zR', nvim_ufo.openAllFolds)
nmap('H', nvim_ufo.peekFoldedLinesUnderCursor)
nmap('zM', nvim_ufo.closeAllFolds)
