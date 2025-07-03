-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

---@class treesitter.Directive
---@field name string
---@field callback function
---@field opts? boolean

---@type treesitter.Directive[]
return {
  {
    name = 'inject-mdx-js!',
    callback = function(_, _, bufnr, _, metadata)
      local filename = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
      local extension = vim.fn.fnamemodify(filename, ':e')

      if extension ~= 'mdx' then
        return
      end

      metadata['injection.language'] = 'javascript'
    end,
  },
  {
    name = 'inject-from-comment!',
    callback = function(match, _, bufnr, pred, metadata)
      local capture_id = pred[2]
      local node = match[capture_id]
      if node == nil then
        return
      end

      local node_text = vim.treesitter.get_node_text(node, bufnr)
      local _, _, parser = string.find(node_text, 'inject:(%a+):')

      metadata['injection.language'] = parser
    end,
  },
}
