local utils = require('utils')

---@param lhs string
---@param rhs string | function
---@param opts? table
local buf_nmap = function(lhs, rhs, opts)
  utils.nmap(lhs, rhs, utils.merge({ buffer = 0 }, opts or {}))
end

buf_nmap('e', '<cr>:cclose<cr>', {
  desc = 'Select item and close quickfix window',
})

buf_nmap('gt', '<c-w><cr><c-w>Tg<tab><cmd>copen<cr>', {
  desc = 'Open item in new tab (silent)',
})
buf_nmap('gT', '<c-w><cr>:cclose<cr><c-w>T', { desc = 'Open item in new tab' })

buf_nmap('gs', '<c-w><cr>:copen<cr>', { desc = 'Open item in new split (silent)' })
buf_nmap('gS', '<c-w><cr>:cclose<cr>', { desc = 'Open item in new split' })
