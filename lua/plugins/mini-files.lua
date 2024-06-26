local config = function()
  local utils = require('utils')

  local nmap = utils.nmap
  local autocmd = utils.autocmd

  local show_dotfiles = true
  local show_excluded = false
  local excluded = { 'node_modules', '.git' }
  local descriptions = {
    ['belowright horizontal split'] = 'Split horizontally',
    ['belowright vertical split'] = 'Split vertically',
    ['tabnew'] = 'Open in new tab',
  }

  local find_string_in = function(list, str)
    for _, element in ipairs(list) do
      if element == str then
        return true
      end
    end

    return false
  end

  local get_map_desc = function(window_type, auto_enter)
    local desc = descriptions[window_type]

    if not auto_enter then
      desc = desc .. ' (silent)'
    end

    return desc
  end

  local map_new_window = function(buf_id, lhs, window_type, auto_enter)
    local rhs = function()
      -- Make new window and set it as target
      local new_target_window
      vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
        vim.cmd(window_type)
        new_target_window = vim.api.nvim_get_current_win()
      end)

      MiniFiles.set_target_window(new_target_window)
      MiniFiles.go_in()

      if auto_enter or false then
        MiniFiles.close()
      end

      if window_type == 'tabnew' and not auto_enter then
        MiniFiles.close()
        vim.cmd('tabprev')
        MiniFiles.open()
      end
    end

    -- Adding `desc` will result into `show_help` entries
    nmap(lhs, rhs, { buffer = buf_id, desc = get_map_desc(window_type, auto_enter) })
  end

  local show_all_files = function()
    return true
  end

  local hide_dotfiles = function(fs_entry)
    return not vim.startswith(fs_entry.name, '.')
  end

  local hide_excluded = function(fs_entry)
    return not find_string_in(excluded, fs_entry.name)
  end

  local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and show_all_files or hide_dotfiles
    MiniFiles.refresh({ content = { filter = new_filter } })
  end

  local toggle_exclude = function()
    show_excluded = not show_excluded
    local new_filter = show_excluded and show_all_files or hide_excluded
    MiniFiles.refresh({ content = { filter = new_filter } })
  end

  require('mini.files').setup({
    content = { filter = hide_excluded },
  })

  nmap('-', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'Open mini.files explorer in current file' })
  nmap('_', MiniFiles.open, { desc = 'Open mini.files explorer' })

  autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id

      nmap('gd', toggle_dotfiles, { buffer = buf_id })
      nmap('ge', toggle_exclude, { buffer = buf_id })
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
