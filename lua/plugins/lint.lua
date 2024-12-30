local config = function()
  local lint = require('lint')
  local autocmd = require('utils').autocmd

  local linting_events = { 'InsertLeave', 'TextChanged' }

  autocmd(linting_events, {
    pattern = '*.github/workflows/*.yml,*.github/workflows/*.yaml',
    callback = function()
      lint.try_lint('actionlint')
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
