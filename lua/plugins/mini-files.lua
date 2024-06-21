local config = function()
  local nmap = require('utils').nmap

  require('mini.files').setup()

  nmap('-', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'Open mini.files explorer in current file' })
  nmap('_', MiniFiles.open, { desc = 'Open mini.files explorer' })
end

return {
  'echasnovski/mini.files',
  config = config,
  version = false,
}
