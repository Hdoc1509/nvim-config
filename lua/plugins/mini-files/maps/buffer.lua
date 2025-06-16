local utils = require('utils')

local M = {}

-- NOTE: enable once updated to nvim-0.10
-- local ui_open = function()
--   vim.ui.open(MiniFiles.get_fs_entry().path)
-- end

local yank_path = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then
    return vim.notify('Cursor is not on valid entry')
  end
  vim.fn.setreg(vim.v.register, path)
end

---@enum WindowType
local WINDOW_TYPE = {
  aboveleft_horizontal_split = 'aboveleft horizontal split',
  aboveleft_vertical_split = 'aboveleft vertical split',
  belowright_horizontal_split = 'belowright horizontal split',
  belowright_vertical_split = 'belowright vertical split',
  tabnew = 'tabnew',
}

---@type table<WindowType, string>
local descriptions = {
  [WINDOW_TYPE.aboveleft_horizontal_split] = 'Split above',
  [WINDOW_TYPE.aboveleft_vertical_split] = 'Split left',
  [WINDOW_TYPE.belowright_horizontal_split] = 'Split below',
  [WINDOW_TYPE.belowright_vertical_split] = 'Split right',
  [WINDOW_TYPE.tabnew] = 'Open in new tab',
}

---@param lhs string
---@param window_type WindowType
---@param opts { buf_id: number,  auto_enter?: boolean }
local nmap_new_window = function(lhs, window_type, opts)
  local auto_enter = opts.auto_enter or false

  local rhs = function()
    -- Make new window and set it as target
    local cur_target = MiniFiles.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(window_type)
      return vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target)
    MiniFiles.go_in({ close_on_file = auto_enter })

    if not auto_enter then
      MiniFiles.set_target_window(cur_target)
    end
  end

  -- Adding `desc` will result into `show_help` entries
  vim.keymap.set('n', lhs, rhs, {
    buffer = opts.buf_id,
    desc = descriptions[window_type] .. (auto_enter and '' or ' (silent)'),
  })
end

M.setup = function(buf_id)
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

  utils.nmap('gy', yank_path, { buffer = buf_id, desc = 'Yank path' })

  nmap_new_window('gj', WINDOW_TYPE.belowright_horizontal_split, { buf_id = buf_id })
  nmap_new_window('gJ', WINDOW_TYPE.belowright_horizontal_split, { auto_enter = true, buf_id = buf_id })
  nmap_new_window('gk', WINDOW_TYPE.aboveleft_horizontal_split, { buf_id = buf_id })
  nmap_new_window('gK', WINDOW_TYPE.aboveleft_horizontal_split, { auto_enter = true, buf_id = buf_id })
  nmap_new_window('gh', WINDOW_TYPE.aboveleft_vertical_split, { buf_id = buf_id })
  nmap_new_window('gH', WINDOW_TYPE.aboveleft_vertical_split, { auto_enter = true, buf_id = buf_id })
  nmap_new_window('gl', WINDOW_TYPE.belowright_vertical_split, { buf_id = buf_id })
  nmap_new_window('gL', WINDOW_TYPE.belowright_vertical_split, { auto_enter = true, buf_id = buf_id })

  nmap_new_window('gt', WINDOW_TYPE.tabnew, { buf_id = buf_id })
  nmap_new_window('gT', WINDOW_TYPE.tabnew, { auto_enter = true, buf_id = buf_id })
end

return M
