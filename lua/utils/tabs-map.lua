local M = {}

---@class TabHandler
---@field onExceed fun()
---@field onAvailable fun(quantity: number) Uses `v:count1` as `quantity` param

---Uses `v:count1` to determine which `handler` callback will be used
---@param handler TabHandler
M.use_previous_tabs = function(handler)
  local current = vim.fn.tabpagenr()

  if current == 1 then
    return
  end

  local count = vim.v.count1
  local available = current - 1

  if count > available then
    handler.onExceed()
  else
    handler.onAvailable(count)
  end
end

return M
