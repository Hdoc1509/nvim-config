local config = function()
  local lint = require('lint')
  local autocmd = require('utils').autocmd

  local ignore_files = {
    'pnpm-lock.yaml',
    'pnpm-workspace.yaml',
  }

  lint.linters_by_ft = {
    yaml = { 'actionlint' },
  }

  autocmd('BufWritePost', {
    callback = function()
      local bufnr = vim.fn.bufnr('%')
      local filename = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))

      if vim.tbl_contains(ignore_files, filename) then
        return
      end

      print('linting ' .. filename)

      lint.try_lint()
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
