local config = function()
  local lint = require('lint')
  local utils = require('utils')
  local autocmd = utils.autocmd

  local normal_events = { 'BufRead', 'BufWritePost' }
  ---@type string[]
  local aggressive_events = vim.fn.extendnew(normal_events, { 'InsertLeave', 'TextChanged' })

  lint.linters_by_ft = {
    groovy = { 'groovy_lint' },
    markdown = { 'markdownlint_custom' },
  }

  ---@diagnostic disable-next-line: inject-field
  lint.linters.groovy_lint = require('plugins.lint.npm-groovy-lint')
  ---@diagnostic disable-next-line: inject-field
  lint.linters.markdownlint_custom = require('plugins.lint.markdownlint')

  autocmd(aggressive_events, {
    pattern = { '*.github/workflows/*.yml', '*.github/workflows/*.yaml' },
    callback = function()
      lint.try_lint('actionlint')
    end,
  })

  autocmd(normal_events, {
    callback = function()
      lint.try_lint()
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
