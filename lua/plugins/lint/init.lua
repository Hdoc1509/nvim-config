local config = function()
  local lint = require('lint')
  local utils = require('utils')
  local autocmd = utils.autocmd

  local normal_events = { 'BufRead', 'BufWritePost' }
  ---@type string[]
  local aggressive_events = vim.fn.extendnew(normal_events, { 'InsertLeave', 'TextChanged' })

  ---@type table<string, table<string, string | string[]>>
  local linter_patterns = {
    aggressive_events = {
      actionlint = { '*.github/workflows/*.yml', '*.github/workflows/*.yaml' },
      markdownlint = '*.md',
      selene = '*.lua',
      groovy_lint = { '*.gradle', '*.groovy' },
    },
  }

  lint.linters.groovy_lint = require('plugins.lint.npm-groovy-lint')
  lint.linters.markdownlint.parser = require('plugins.lint.markdownlint').parser
  lint.linters.selene.parser = require('plugins.lint.selene').parser

  for linter, pattern in pairs(linter_patterns.aggressive_events) do
    autocmd(aggressive_events, {
      pattern = pattern,
      callback = function()
        lint.try_lint(linter)
      end,
    })
  end

  -- TODO: try to add `ts_query_ls lint` for query files in `query/` folder
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
