local M = {}

-- reference: https://vim.fandom.com/wiki/Move_current_window_between_tabs

M.move_window_to_prev_tab = function()
  -- there is only one window
  if vim.fn.tabpagenr('$') == 1 and vim.fn.winnr('$') == 1 then
    return
  end

  -- preparing new window
  local tab_nr = vim.fn.tabpagenr('$')
  local cur_buf = vim.api.nvim_get_current_buf()

  if vim.fn.tabpagenr() ~= 1 then
    vim.cmd('close!')
    if tab_nr == vim.fn.tabpagenr('$') then
      vim.cmd('tabprev')
    end
    vim.cmd('split')
  else
    vim.cmd('close!')
    vim.cmd('0tabnew')
  end

  -- opening current buffer in new window
  vim.cmd('b' .. cur_buf)
end

M.move_window_to_next_tab = function()
  --there is only one window
  if vim.fn.tabpagenr('$') == 1 and vim.fn.winnr('$') == 1 then
    return
  end

  --preparing new window
  local tab_nr = vim.fn.tabpagenr('$')
  local cur_buf = vim.api.nvim_get_current_buf()

  if vim.fn.tabpagenr() < tab_nr then
    vim.cmd('close!')
    if tab_nr == vim.fn.tabpagenr('$') then
      vim.cmd('tabnext')
    end
    vim.cmd('split')
  else
    vim.cmd('close!')
    vim.cmd('tabnew')
  end

  --opening current buffer in new window
  vim.cmd('b' .. cur_buf)
end

return M
