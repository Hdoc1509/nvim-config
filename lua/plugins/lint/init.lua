local config = function()
  local lint = require('lint')
  local utils = require('utils')
  local autocmd = utils.autocmd

  local linting_events = { 'BufRead', 'BufWritePost' }

  lint.linters_by_ft = {
    groovy = { 'groovy_lint' },
  }

  lint.linters.groovy_lint = require('plugins.lint.npm-groovy-lint')

  autocmd(vim.fn.extendnew(linting_events, { 'InsertLeave', 'TextChanged' }), {
    pattern = '*.github/workflows/*.yml,*.github/workflows/*.yaml',
    callback = function()
      lint.try_lint('actionlint')
    end,
  })

  autocmd(linting_events, {
    callback = function()
      lint.try_lint()
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
