local config_path = vim.fn.stdpath('config') --[[@as string]]
local plugins_path = config_path .. '/lua/plugins'

---@type table<string, TSPredicate>
local new_predicates = {
  ['is-conf-file?'] = function(_, _, bufnr)
    return type(bufnr) == 'number' and vim.bo[bufnr].filetype == 'conf' or false
  end,
  ['is-lazy-config-file?'] = function(_, _, bufnr)
    if type(bufnr) ~= 'number' then
      return false
    end

    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename:match('%.lua$') == nil or filename:match(plugins_path .. '/init%.lua$') ~= nil then
      return false
    end

    return filename:match(plugins_path .. '/[%a-]+/init%.lua$') ~= nil
      or filename:match(plugins_path .. '/[%a-]+%.lua$') ~= nil
  end,
  ['is-nvim-config-file?'] = function(_, _, bufnr, pred)
    if type(bufnr) ~= 'number' then
      return false
    end

    local target_filename = pred[2]
    local filename = vim.api.nvim_buf_get_name(bufnr)

    if type(target_filename) ~= 'string' or target_filename == '' then
      return filename:match(config_path) ~= nil
    end

    return config_path .. '/' .. target_filename == filename
  end,
  ['is-linter-config-file?'] = function(_, _, bufnr)
    if type(bufnr) ~= 'number' then
      return false
    end

    local filename = vim.api.nvim_buf_get_name(bufnr)
    return filename:match(plugins_path .. '/lint/[%a-]+%.lua$') ~= nil
  end,
  ['is-fabric-mod-json?'] = function(_, _, bufnr)
    if type(bufnr) ~= 'number' then
      return false
    end

    local filename = vim.api.nvim_buf_get_name(bufnr)
    return filename:match('fabric%.mod%.json$') ~= nil
  end,
}

return {
  setup = function()
    for name, handler in pairs(new_predicates) do
      vim.treesitter.query.add_predicate(name, handler, { all = true })
    end
  end,
}
