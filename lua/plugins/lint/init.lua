local config = function()
  local lint = require('lint')
  local utils = require('utils')
  local autocmd = utils.autocmd

  local normal_events = { 'BufRead', 'BufWritePost' }
  ---@type string[]
  local aggressive_events = vim.fn.extendnew(normal_events, { 'InsertLeave', 'TextChanged' })

  lint.linters_by_ft = {
    groovy = { 'groovy_lint' },
    markdown = { 'markdownlint' },
  }

  lint.linters.groovy_lint = require('plugins.lint.npm-groovy-lint')

  autocmd(normal_events, {
    pattern = '*.github/workflows/*.yml,*.github/workflows/*.yaml',
    callback = function()
      lint.try_lint('actionlint')
    end,
  })

  autocmd(aggressive_events, {
    callback = function()
      lint.try_lint()
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
