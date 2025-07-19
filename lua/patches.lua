local lsp_util = require('vim.lsp.util')
local base_popup_opts = lsp_util.make_floating_popup_options

-- NOTE: needed for tree-sitter-test. not needed from nvim-0.10
if vim.fs.joinpath == nil then
  --- Concatenate directories and/or file paths into a single path with normalization
  --- (e.g., `"foo/"` and `"bar"` get joined to `"foo/bar"`)
  ---
  ---@param ... string
  ---@return string
  function vim.fs.joinpath(...)
    return (table.concat({ ... }, '/'):gsub('//+', '/'))
  end
end

-- prevent lightiline.vim from breaking when opening a floating window with:
-- - vim.diagnostic.goto_next()
-- - vim.diagnostic.goto_prev()
-- - vim.lsp.buf.hover()
-- https://github.com/itchyny/lightline.vim/pull/659#issuecomment-1704032081
---@diagnostic disable-next-line: duplicate-set-field
lsp_util.make_floating_popup_options = function(width, height, opts)
  -- NOTE: check if this is needed from nvim-0.10
  local base_opts = base_popup_opts(width, height, opts)
  base_opts.noautocmd = true
  return base_opts
end
