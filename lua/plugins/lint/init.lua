local config = function()
  local lint = require('lint')
  local utils = require('utils')
  local autocmd = utils.autocmd

  local normal_events = { 'BufRead', 'BufWritePost' }
  ---@type string[]
  local aggressive_events = vim.fn.extendnew(normal_events, { 'InsertLeave', 'TextChanged' })

  lint.linters_by_ft = {
    groovy = { 'groovy_lint' },
  }

  lint.linters.groovy_lint = require('plugins.lint.npm-groovy-lint')
  lint.linters.markdownlint_custom = require('plugins.lint.markdownlint')
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
      lint.try_lint('markdownlint_custom')
    end,
  })

  -- TODO: try to add `ts_query_ls lint` for query files in `query/` folder

  -- NOTE: until https://github.com/Kampfkarren/selene/issues/224 has been fixed
  autocmd(aggressive_events, {
    pattern = '*.lua',
    callback = function()
      lint.try_lint('selene')
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
