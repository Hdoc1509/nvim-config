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

local get_map_desc = function(window_type, auto_enter)
  local desc = descriptions[window_type]

  if not auto_enter then
    desc = desc .. ' (silent)'
  end

  return desc
end

---@param lhs string
---@param window_type WindowType
---@param opts { buf_id: number,  auto_enter?: boolean }
M.nmap_new_window = function(lhs, window_type, opts)
  local auto_enter = opts.auto_enter or false
  local buf_id = opts.buf_id

  local rhs = function()
    -- Make new window and set it as target
    local new_target_window
    vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
      vim.cmd(window_type)
      new_target_window = vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target_window)
    ---@diagnostic disable-next-line: missing-parameter
    MiniFiles.go_in()

    if auto_enter or false then
      MiniFiles.close()
    end

    if window_type == 'tabnew' and not auto_enter then
      MiniFiles.close()
      vim.cmd('tabprev')
      MiniFiles.open(MiniFiles.get_latest_path())
    end
  end

  -- Adding `desc` will result into `show_help` entries
  vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = get_map_desc(window_type, auto_enter) })
end

return M
