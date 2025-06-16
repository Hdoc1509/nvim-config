local config = function()
  local utils = require('utils')
  local nmap = utils.nmap
  local maps = require('plugins.mini-files.maps')
  local prefix = require('plugins.mini-files.prefix')
  local excluded_filetypes = { 'fugitive', 'minifiles' }

  local set_mark = function(id, path, desc)
    MiniFiles.set_bookmark(id, path, { desc = desc })
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
      maps.set_mini_files_mappings(args.data.buf_id)
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
