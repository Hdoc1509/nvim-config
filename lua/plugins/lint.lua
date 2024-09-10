local config = function()
  local lint = require('lint')
  local autocmd = require('utils').autocmd

  lint.linters_by_ft = {
    yaml = { 'actionlint' },
  }

  autocmd('BufWritePost', {
    callback = function()
      lint.try_lint()
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
