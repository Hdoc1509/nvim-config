local config = function()
  local utils = require('utils')
  local nmap = utils.nmap
  local maps = require('plugins.mini-files.maps')
  local prefix = require('plugins.mini-files.prefix')
  local nmap_new_window = maps.nmap_new_window
  local WINDOW_TYPE = maps.WINDOW_TYPE
  local excluded_filetypes = { 'fugitive', 'minifiles' }

  local set_mark = function(id, path, desc)
    MiniFiles.set_bookmark(id, path, { desc = desc })
  end

  local yank_path = function()
    local path = (MiniFiles.get_fs_entry() or {}).path
    if path == nil then
      return vim.notify('Cursor is not on valid entry')
    end
    vim.fn.setreg(vim.v.register, path)
  end

  -- NOTE: enable once updated to nvim-0.10
  -- local ui_open = function()
  --   vim.ui.open(MiniFiles.get_fs_entry().path)
  -- end

  ---@param onAllowed function
  local open_explorer = function(onAllowed)
    if not vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
      onAllowed()
    end
  end

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
    open_explorer(function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end)
  end, { desc = 'Open mini.files in current file' })
  nmap('<leader>-', function()
    open_explorer(function()
      MiniFiles.open(MiniFiles.get_latest_path())
    end)
  end, { desc = 'Open mini.files in last used path' })
  nmap('<leader>_', function()
    open_explorer(function()
      MiniFiles.open(nil, false)
    end)
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

      -- TODO: enable once updated to nvim-0.10
      -- nmap('gX', ui_open, { buffer = buf_id, desc = 'OS open' })

      nmap('gy', yank_path, { buffer = buf_id, desc = 'Yank path' })

      nmap_new_window('gs', WINDOW_TYPE.belowright_horizontal_split, { buf_id = buf_id })
      nmap_new_window('gS', WINDOW_TYPE.belowright_horizontal_split, { auto_enter = true, buf_id = buf_id })
      nmap_new_window('gv', WINDOW_TYPE.belowright_vertical_split, { buf_id = buf_id })
      nmap_new_window('gV', WINDOW_TYPE.belowright_vertical_split, { auto_enter = true, buf_id = buf_id })
      nmap_new_window('gt', WINDOW_TYPE.tabnew, { buf_id = buf_id })
      nmap_new_window('gT', WINDOW_TYPE.tabnew, { auto_enter = true, buf_id = buf_id })
    end,
  })

  utils.autocmd('User', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
      set_mark('c', vim.fn.stdpath('config'), 'Config')
      set_mark('w', vim.fn.getcwd, 'Current working directory')
      set_mark('~', '~', 'Home directory')
    end,
  })
end

return {
  'echasnovski/mini.files',
  config = config,
  version = false,
}
