local diagnostic_icons = require('icons').diagnostics

-- FIX: set last diagnostic per buffer
local last_label = {}

---@param props { mode: string, bufnr: number}
return function(props)
  if props.mode == 'insert' then
    return last_label
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

  last_label = label
  return label
end
