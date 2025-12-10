---@type table<string,TSDirective>
local directives = {
  ['offset-gh-actions-on-push-pr!'] = function(match, _, _, pred, metadata)
    -- based on: $VIMRUNTIME/lua/vim/treesitter/query.lua:529
    local capture_id = pred[2] --[[@as integer]]
    local nodes = match[capture_id]
    if not nodes or #nodes == 0 then
      return
    end
    assert(#nodes == 1, '#offset-gh-actions-on-push-pr! does not support captures on multiple nodes')

    local node = nodes[1]

    if not metadata[capture_id] then
      metadata[capture_id] = {}
    end

    local range = metadata[capture_id].range or { node:range() }

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
      vim.treesitter.query.add_directive(name, handler, { all = true })
    end
  end,
}
