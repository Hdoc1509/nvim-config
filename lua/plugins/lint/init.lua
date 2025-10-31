local config = function()
  local lint = require('lint')
  local utils = require('utils')

  local normal_events = { 'BufRead', 'BufWritePost' }
  ---@type string[]
  local aggressive_events = vim.fn.extendnew(normal_events, {
    'InsertLeave',
    'TextChanged',
  })

  ---@type table<string, table<string, string | string[]>>
  local linter_patterns = {
    aggressive_events = {
      actionlint = { '*.github/workflows/*.yml', '*.github/workflows/*.yaml' },
      markdownlint = '*.md',
      selene = '*.lua',
      groovy_lint = { '*.gradle', '*.groovy' },
    },
    normal_events = {
      ts_query_ls = '**queries/**/*.scm',
    },
  }

  -- disable built-in `query` linter
  vim.g.query_lint_on = {}

  lint.linters.groovy_lint = require('plugins.lint.npm-groovy-lint')
  lint.linters.markdownlint.parser = require('plugins.lint.markdownlint').parser
  lint.linters.selene.parser = require('plugins.lint.selene').parser
  lint.linters.ts_query_ls = require('plugins.lint.ts-query-ls')

  for linter, pattern in pairs(linter_patterns.aggressive_events) do
    utils.autocmd(aggressive_events, {
      pattern = pattern,
      callback = function()
        lint.try_lint(linter)
      end,
    })
  end

  for linter, pattern in pairs(linter_patterns.normal_events) do
    utils.autocmd(normal_events, {
      pattern = pattern,
      callback = function()
        lint.try_lint(linter)
      end,
    })
  end
end

return {
  'mfussenegger/nvim-lint',
  config = config,
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', version = '*' },
    { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
    -- { dir = '~/dev/nvim-plugins/gh-actions.nvim' },
    { 'Hdoc1509/gh-actions.nvim', version = '0.1.0' },
    -- { 'Hdoc1509/gh-actions.nvim', branch = 'master' },
    -- { dir = '~/dev/nvim-plugins/vim-map-side.nvim' },
    { 'Hdoc1509/vim-map-side.nvim', version = '0.1.0' },
    -- { 'Hdoc1509/vim-map-side.nvim', branch = 'master' },
  },
}
