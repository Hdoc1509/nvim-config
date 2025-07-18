local diagnostic_icons = require('icons').diagnostics

---@type table<number, table>
local last_label = {}

---@param props { mode: string, bufnr: number}
---@return table
return function(props)
  if props.mode == 'insert' then
    return last_label[tostring(props.bufnr)] or {}
  end

  local label = {}

  for severity, icon in pairs(diagnostic_icons) do
    local severityOption = vim.diagnostic.severity[string.upper(severity)]
    local quantity = #vim.diagnostic.get(props.bufnr, {
      severity = severityOption,
    })

    if quantity > 0 then
      table.insert(label, {
        ' ' .. icon .. ' ' .. quantity,
        group = 'DiagnosticSign' .. severity,
      })
    end
  end

  if #label > 0 then
    table.insert(label, ' ')
  end

  last_label[tostring(props.bufnr)] = label
  return label
end
