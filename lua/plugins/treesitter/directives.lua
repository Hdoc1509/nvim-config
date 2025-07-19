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
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local ext = vim.fn.fnamemodify(filename, ':e')
      if ext ~= 'mdx' then
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

      metadata['injection.language'] = string.match(node_text, 'inject:(%a+):')
    end,
  },
  {
    name = 'inject-yaml-githubactions!',
    callback = function(match, _, bufnr, pred)
      local capture_id = pred[2]
      local node = match[capture_id]
      if node == nil then
        return
      end

      local node_text = vim.treesitter.get_node_text(node, bufnr)
      -- local pattern = '${{%s?%a+%.[%u_]+%s?}}'

      for expression in string.gmatch(node_text, '${{%s?.+%s?}}') do
        print(expression)
        local start_idx, end_idx = string.find(node_text, expression)

        print('start_idx: ', start_idx)
        print('end_idx: ', end_idx)

        -- NOTE: should I create runtime queries to apply range injections per
        -- matched string?
      end
    end,
  },
}
