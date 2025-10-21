-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

---@type table<string,TSDirective>
local directives = {
  ['inject-mdx-js!'] = function(_, _, bufnr, _, metadata)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local ext = vim.fn.fnamemodify(filename, ':e')
    if ext ~= 'mdx' then
      return
    end

    metadata['injection.language'] = 'javascript'
  end,
}

return {
  setup = function()
    for name, handler in pairs(directives) do
      vim.treesitter.query.add_directive(name, handler)
    end
  end,
}
