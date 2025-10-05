-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

local plugins_path = vim.fn.stdpath('config') .. '/lua/plugins'

---@class treesitter.PredicateConfig
---@field name string
---@field callback TSPredicate
---@field opts? boolean

---@type treesitter.PredicateConfig[]
local predicates = {
  {
    name = 'is-conf-file?',
    callback = function(_, _, bufnr)
      return vim.bo[bufnr].filetype == 'conf'
    end,
  },
  {
    name = 'is-lazy-config-file?',
    callback = function(_, _, bufnr)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if filename:match('%.lua$') == nil or filename:match(plugins_path .. '/init%.lua$') ~= nil then
        return false
      end

      return filename:match(plugins_path .. '/[%a-]+/init%.lua$') ~= nil
        or filename:match(plugins_path .. '/[%a-]+%.lua$') ~= nil
    end,
  },
}

return {
  setup = function()
    for _, predicate in ipairs(predicates) do
      vim.treesitter.query.add_predicate(predicate.name, predicate.callback, predicate.opts)
    end
  end,
}
