local config = function()
  local lint = require('lint')
  local utils = require('utils')
  local autocmd = utils.autocmd

  local normal_events = { 'BufRead', 'BufWritePost' }
  ---@type string[]
  local aggressive_events = vim.fn.extendnew(normal_events, { 'InsertLeave', 'TextChanged' })

  lint.linters.groovy_lint = require('plugins.lint.npm-groovy-lint')
  lint.linters.markdownlint.parser = require('plugins.lint.markdownlint').parser
  lint.linters.selene.parser = require('plugins.lint.selene').parser

  autocmd(aggressive_events, {
    pattern = { '*.github/workflows/*.yml', '*.github/workflows/*.yaml' },
    callback = function()
      lint.try_lint('actionlint')
    end,
  })

  autocmd(aggressive_events, {
    pattern = '*.md',
    callback = function()
      lint.try_lint('markdownlint')
    end,
  })

  -- TODO: try to add `ts_query_ls lint` for query files in `query/` folder

  autocmd(aggressive_events, {
    pattern = '*.lua',
    callback = function()
      lint.try_lint('selene')
    end,
  })

  autocmd(aggressive_events, {
    pattern = { '*.gradle', '*.groovy' },
    callback = function()
      lint.try_lint('groovy_lint')
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
