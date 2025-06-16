local M = {}

---@enum WindowType
M.WINDOW_TYPE = {
  belowright_horizontal_split = 'belowright horizontal split',
  belowright_vertical_split = 'belowright vertical split',
  tabnew = 'tabnew',
}

---@type table<WindowType, string>
local descriptions = {
  [M.WINDOW_TYPE.belowright_horizontal_split] = 'Split horizontally',
  [M.WINDOW_TYPE.belowright_vertical_split] = 'Split vertically',
  [M.WINDOW_TYPE.tabnew] = 'Open in new tab',
}

---@param lhs string
---@param window_type WindowType
---@param opts { buf_id: number,  auto_enter?: boolean }
M.nmap_new_window = function(lhs, window_type, opts)
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

return M
