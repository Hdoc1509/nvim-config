local config = function()
  local lint = require('lint')
  local autocmd = require('utils').autocmd

  lint.linters_by_ft = {
    yaml = { 'actionlint' },
  }

  autocmd('BufWritePost', {
    -- TODO: add treesitter query to highlight this pattern as vim pattern
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
