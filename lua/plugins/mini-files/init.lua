local config = function()
  local utils = require('utils')
  local nmap = utils.nmap
  local filters = require('plugins.mini-files.filters')
  local maps = require('plugins.mini-files.maps')
  local map_new_window = maps.map_new_window
  local WINDOW_TYPE = maps.WINDOW_TYPE

  require('mini.files').setup({
    content = { filter = filters.hide_excluded },
  })

  nmap('-', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'Open mini.files in current file' })
  nmap('<leader>-', function()
    MiniFiles.open(MiniFiles.get_latest_path())
  end, { desc = 'Open mini.files in last used path' })
  nmap('<leader>_', function()
    MiniFiles.open(nil, false)
  end, { desc = 'Open mini.files in root path of workspace' })

  utils.autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id

      nmap('gd', filters.toggle_dotfiles, { buffer = buf_id })
      nmap('ge', filters.toggle_exclude, { buffer = buf_id })
      map_new_window(buf_id, 'gs', WINDOW_TYPE.belowright_horizontal_split)
      map_new_window(buf_id, 'gS', WINDOW_TYPE.belowright_horizontal_split, true)
      map_new_window(buf_id, 'gv', WINDOW_TYPE.belowright_vertical_split)
      map_new_window(buf_id, 'gV', WINDOW_TYPE.belowright_vertical_split, true)
      map_new_window(buf_id, 'gt', WINDOW_TYPE.tabnew)
      map_new_window(buf_id, 'gT', WINDOW_TYPE.tabnew, true)
    end,
  })
end

return {
  'echasnovski/mini.files',
  config = config,
  version = false,
}
