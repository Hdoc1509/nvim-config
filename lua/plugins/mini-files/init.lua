local config = function()
  local utils = require('utils')
  local nmap = utils.nmap
  local filters = require('plugins.mini-files.filters')
  local map_new_window = require('plugins.mini-files.maps').map_new_window

  require('mini.files').setup({
    content = { filter = filters.hide_excluded },
  })

  nmap('-', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'Open mini.files explorer in current file' })
  nmap('_', MiniFiles.open, { desc = 'Open mini.files explorer' })

  utils.autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id

      nmap('gd', filters.toggle_dotfiles, { buffer = buf_id })
      nmap('ge', filters.toggle_exclude, { buffer = buf_id })
      map_new_window(buf_id, 'gs', 'belowright horizontal split')
      map_new_window(buf_id, 'gS', 'belowright horizontal split', true)
      map_new_window(buf_id, 'gv', 'belowright vertical split')
      map_new_window(buf_id, 'gV', 'belowright vertical split', true)
      map_new_window(buf_id, 'gt', 'tabnew')
      map_new_window(buf_id, 'gT', 'tabnew', true)
    end,
  })
end

return {
  'echasnovski/mini.files',
  config = config,
  version = false,
}
