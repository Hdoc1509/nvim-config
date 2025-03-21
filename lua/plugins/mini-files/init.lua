local config = function()
  local utils = require('utils')
  local nmap = utils.nmap
  local maps = require('plugins.mini-files.maps')
  local prefix = require('plugins.mini-files.prefix')
  local nmap_new_window = maps.nmap_new_window
  local WINDOW_TYPE = maps.WINDOW_TYPE

  require('mini.files').setup({
    content = {
      filter = function(entry)
        -- NOTE: files/folders that will always be hidden
        return entry.name ~= '.git'
      end,
      prefix = prefix,
    },
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

      -- allow to confirm changes on write. taken from:
      -- https://github.com/mrjones2014/dotfiles/blob/31f7988420e5418925022c524de04934e02a427c/nvim/lua/my/configure/mini_files.lua#L14
      vim.api.nvim_buf_set_option(buf_id, 'buftype', 'acwrite')
      vim.api.nvim_buf_set_name(buf_id, string.format('mini.files-%s', vim.loop.hrtime()))
      utils.autocmd('BufWriteCmd', {
        buffer = buf_id,
        callback = function()
          MiniFiles.synchronize()
        end,
      })

      nmap_new_window('gs', WINDOW_TYPE.belowright_horizontal_split, { buf_id = buf_id })
      nmap_new_window('gS', WINDOW_TYPE.belowright_horizontal_split, { auto_enter = true, buf_id = buf_id })
      nmap_new_window('gv', WINDOW_TYPE.belowright_vertical_split, { buf_id = buf_id })
      nmap_new_window('gV', WINDOW_TYPE.belowright_vertical_split, { auto_enter = true, buf_id = buf_id })
      nmap_new_window('gt', WINDOW_TYPE.tabnew, { buf_id = buf_id })
      nmap_new_window('gT', WINDOW_TYPE.tabnew, { auto_enter = true, buf_id = buf_id })
    end,
  })
end

return {
  'echasnovski/mini.files',
  config = config,
  version = false,
}
