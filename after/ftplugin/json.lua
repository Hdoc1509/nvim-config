local utils = require('utils')

utils.nmap('o', function()
  local line = vim.api.nvim_get_current_line()
  return line:find('[^,{[]$') and 'A,<cr>' or 'o'
end, { buffer = 0, expr = true })
