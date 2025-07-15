-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

---@class treesitter.Directive
---@field name string
---@field callback function
---@field opts? boolean

---@type treesitter.Directive[]
return {
  {
    -- TODO: use a predicate instead of directive
    -- name = 'is-mdx-file?'
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
