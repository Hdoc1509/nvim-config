-- TODO: add more errorformats if more are found
local errorformat = table.concat({
  '%WWarning in %f on line %l%s col %c:,%Z%m',
  '%EError in %f on line %l%s col %c:,%Z%m',
}, ',')

local vd = vim.diagnostic
local severity_by_qftype = {
  E = vd.severity.ERROR,
  W = vd.severity.WARN,
  I = vd.severity.INFO,
  N = vd.severity.HINT,
}

local diagnostic_skeleton = {
  source = 'ts_query_ls',
  severity = vd.severity.WARN,
}

-- uncomment ⬇ and `go to definition`. adapted from:
-- require('lint.parser').from_errorformat
---@param output string
local parser = function(output)
  local lines = vim.split(output, '\n')
  local qflist = vim.fn.getqflist({ efm = errorformat, lines = lines })
  local result = {}

  for _, item in ipairs(qflist.items) do
    if item.valid == 1 then
      -- NOTE: do not decrease `lnum` nor `col` by `1`
      local lnum = math.max(0, item.lnum)
      local col = math.max(0, item.col)
      local diagnostic = {
        lnum = lnum,
        col = col,
        end_lnum = item.end_lnum > 0 and (item.end_lnum - 1) or lnum,
        end_col = item.end_col > 0 and (item.end_col - 1) or col,
        severity = item.type ~= '' and severity_by_qftype[item.type:upper()] or nil,
        message = item.text:match('^%s*(.-)%s*$'),
      }

      table.insert(result, vim.tbl_extend('keep', diagnostic, diagnostic_skeleton))
    end
  end

  return result
end

---@type lint.Linter
---@diagnostic disable-next-line: missing-fields
return {
  cmd = 'ts_query_ls',
  args = {
    'lint',
    '--config',
    vim.json.encode(require('plugins.lsp.servers.ts_query_ls').settings),
  },
  ignore_exitcode = true,
  append_fname = true,
  stream = 'stderr',
  parser = function(output)
    local diagnostics = parser(output)
    -- print(vim.inspect(diagnostics))
    return diagnostics
  end,
}
