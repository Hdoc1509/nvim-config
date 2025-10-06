-- NOTE: in neovim 0.9. `opts` is a boolean, from 0.10 it's a table
-- be sure to update the type when migrating to neovim 0.10

---@class treesitter.Directive
---@field name string
---@field callback TSDirective
---@field opts? boolean

-- TODO: update structure
-- ---@type table<string,TSDirective>
-- local directives = {
--   ['directive-name!'] = function() end
-- }

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
  {
    name = 'inject-vim-mapping-cmd!',
    callback = function(match, _, bufnr, pred, metadata)
      -- reference (gF): $VIMRUNTIME/lua/vim/treesitter/query.lua:422
      local capture_id = pred[2]
      if type(capture_id) ~= 'number' then
        return
      end

      local node = match[capture_id]
      if not node then
        return
      end

      if not metadata[capture_id] then
        ---@diagnostic disable-next-line: missing-fields
        metadata[capture_id] = {}
      end

      local range = metadata[capture_id].range or { match[capture_id]:range() }
      local rhs = vim.treesitter.get_node_text(node, bufnr)
      local start_col_offset = nil
      local end_col = nil

      local cr_start = rhs:find('<cr>')
      local start_colon = rhs:match('^:')

      if cr_start ~= nil then
        end_col = range[2] + cr_start - 1

        if start_colon ~= nil then
          start_col_offset = 1
        elseif rhs:match('^<cmd>') ~= nil then
          start_col_offset = 5
        end
      else
        if start_colon ~= nil then
          local end_space = rhs:find('%s$')
          if end_space == nil then
            return
          end

          start_col_offset = 1
          end_col = range[2] + end_space - 1
        end
      end

      if start_col_offset == nil or end_col == nil then
        return
      end

      range[2] = range[2] + start_col_offset
      range[4] = end_col

      if range[2] <= range[4] then
        metadata[capture_id].range = range
        metadata['injection.language'] = 'vim'
      end
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
