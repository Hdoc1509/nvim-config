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
  ['offset-gh-actions-on-push-pr!'] = function(match, _, _, pred, metadata)
    -- based on: $VIMRUNTIME/lua/vim/treesitter/query.lua:422
    ---@cast pred integer[]
    local capture_id = pred[2]
    local node = match[capture_id]

    if not node then
      return
    end

    if not metadata[capture_id] then
      ---@diagnostic disable-next-line: missing-fields
      metadata[capture_id] = {}
    end

    local range = metadata[capture_id].range or { match[capture_id]:range() }

    if node:type():match('_quote_scalar$') then
      range[2] = range[2] + 1
      range[4] = range[4] - 1
    end

    -- If this produces an invalid range, we just skip it.
    if range[1] < range[3] or (range[1] == range[3] and range[2] <= range[4]) then
      metadata[capture_id].range = range
    end
  end,
}

return {
  setup = function()
    for name, handler in pairs(directives) do
      vim.treesitter.query.add_directive(name, handler)
    end
  end,
}
