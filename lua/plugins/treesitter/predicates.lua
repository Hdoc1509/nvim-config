-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

local config_path = vim.fn.stdpath('config')
local plugins_path = config_path .. '/lua/plugins'

---@type table<string, TSPredicate>
local new_predicates = {
  ['is-conf-file?'] = function(_, _, bufnr)
    return vim.bo[bufnr].filetype == 'conf'
  end,
  ['is-lazy-config-file?'] = function(_, _, bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename:match('%.lua$') == nil or filename:match(plugins_path .. '/init%.lua$') ~= nil then
      return false
    end

    return filename:match(plugins_path .. '/[%a-]+/init%.lua$') ~= nil
      or filename:match(plugins_path .. '/[%a-]+%.lua$') ~= nil
  end,
  ['is-nvim-config-file?'] = function(_, _, bufnr, pred)
    local target_filename = pred[2]
    local filename = vim.api.nvim_buf_get_name(bufnr)

    if type(target_filename) ~= 'string' or target_filename == '' then
      return filename:match(config_path) ~= nil
    end

    return config_path .. '/' .. target_filename == vim.api.nvim_buf_get_name(bufnr)
  end,
  ['is-linter-config-file?'] = function(_, _, bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    return filename:match(plugins_path .. '/lint/[%a-]+%.lua$') ~= nil
  end,
  ['is-fabric-mod-json?'] = function(_, _, bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    return filename:match('fabric%.mod%.json$') ~= nil
  end,
}

return {
  setup = function()
    for name, handler in pairs(new_predicates) do
      vim.treesitter.query.add_predicate(name, handler)
    end
  end,
}
