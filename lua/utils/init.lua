local M = {}

local map_opts = { silent = true, noremap = true }

---Create an autocommand
---@param event string | string[]
---@param opts table
M.autocmd = function(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

---Create a keymap
---@param mode string | string[]
---@param lhs string left-hand side of mapping
---@param rhs string | function right-hand side of mapping
---@param opts? table aditional options
M.keymap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, M.merge(map_opts, opts))
end

M.map_notify = function(message)
  vim.notify(message, 'info', {
    title = 'Mapping',
  })
end

---Merge two or more tables recursively
---@param tableA table
---@param tableB table
---@param ... table
---@return table
M.merge = function(tableA, tableB, ...)
  return vim.tbl_deep_extend('force', tableA, tableB, ...)
end

---Create a nmap
---@param lhs string left-hand side of nmap
---@param rhs string | function righ-hand side of nmap
---@param opts? table aditional options
M.nmap = function(lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set('n', lhs, rhs, M.merge(map_opts, opts))
end

-- Move windows taken from:
-- https://vim.fandom.com/wiki/Move_current_window_between_tabs

M.move_window_to_prev_tab = function()
  -- there is only one window
  if vim.fn.tabpagenr('$') == 1 and vim.fn.winnr('$') == 1 then
    return
  end
  -- preparing new window
  local tab_nr = vim.fn.tabpagenr('$')
  local cur_buf = vim.fn.bufnr('%')
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
  local cur_buf = vim.fn.bufnr('%')
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
