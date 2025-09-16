-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

---@class treesitter.Directive
---@field name string
---@field callback function
---@field opts? boolean

---@type treesitter.Directive[]
local directives = {
  {
    name = 'inject-mdx-js!',
    callback = function(_, _, bufnr, _, metadata)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local ext = vim.fn.fnamemodify(filename, ':e')
      if ext ~= 'mdx' then
        return
      end

      metadata['injection.language'] = 'javascript'
    end,
  },
}

return {
  setup = function()
    for _, directive in ipairs(directives) do
      vim.treesitter.query.add_directive(directive.name, directive.callback, directive.opts)
    end
  end,
}
