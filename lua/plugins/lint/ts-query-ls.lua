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

-- uncomment ⬇ and `go to definition`. adapted from:
-- require('lint.parser').from_errorformat()
local function custom_from_errorformat(efm, skeleton)
  skeleton = skeleton or {}
  skeleton.severity = skeleton.severity or vd.severity.ERROR
  return function(output, bufnr)
    local lines = vim.split(output, '\n')
    local qflist = vim.fn.getqflist({ efm = efm, lines = lines })
    local result = {}
    for _, item in ipairs(qflist.items) do
      if item.valid == 1 and (bufnr == nil or item.bufnr == 0 or item.bufnr == bufnr) then
        -- NOTE: do not decrease `lnum` nor `col` by `1`
        local lnum = math.max(0, item.lnum)
        local col = math.max(0, item.col)
        local end_lnum = item.end_lnum > 0 and (item.end_lnum - 1) or lnum
        local end_col = item.end_col > 0 and (item.end_col - 1) or col
        local severity = item.type ~= '' and severity_by_qftype[item.type:upper()] or nil
        local diagnostic = {
          lnum = lnum,
          col = col,
          end_lnum = end_lnum,
          end_col = end_col,
          severity = severity,
          message = item.text:match('^%s*(.-)%s*$'),
        }
        table.insert(result, vim.tbl_extend('keep', diagnostic, skeleton or {}))
      end
    end
    return result
  end
end

local parser = custom_from_errorformat(errorformat, {
  source = 'ts_query_ls',
  severity = vim.diagnostic.severity.WARN,
})

---@type lint.Linter
---@diagnostic disable-next-line: missing-fields
return {
  cmd = 'ts_query_ls',
  args = { 'lint' },
  ignore_exitcode = true,
  append_fname = true,
  stream = 'stderr',
  parser = function(output, _)
    -- NOTE: `nil` as bufnr (_ param) to prevent diagnostic from being filtered
    -- for some reason bufnr from `parser()` returned by `.from_errorformat()`
    -- doesn't match the retrieved from vim.fn.getqflist({ efm = efm, lines = lines })
    -- that is called within `parser()`

    ---@diagnostic disable-next-line: param-type-mismatch
    local diagnostics = parser(output, nil)
    -- print(vim.inspect(diagnostics))
    return diagnostics
  end,
}
