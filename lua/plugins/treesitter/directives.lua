---@type table<string,TSDirective>
local directives = {
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
