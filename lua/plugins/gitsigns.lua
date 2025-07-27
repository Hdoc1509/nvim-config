local config = function()
  local gitsigns = require('gitsigns')
  local utils = require('utils')

  gitsigns.setup({
    on_attach = function(bufnr)
      local buf_nmap = function(lhs, rhs, opts)
        utils.nmap(lhs, rhs, utils.merge({ buffer = bufnr }, opts or {}))
      end

      buf_nmap(']c', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gitsigns.nav_hunk('next', { target = 'all' })
        end
      end, { desc = 'Jump to next hunk' })

      buf_nmap('[c', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gitsigns.nav_hunk('prev', { target = 'all' })
        end
      end, { desc = 'Jump to previous hunk' })

      buf_nmap('<leader>hs', gitsigns.stage_hunk, {
        desc = 'Stage/unstage hunk under cursor',
      })
      utils.keymap('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Stage/unstage selected hunk(s)', buffer = bufnr })

      buf_nmap('<leader>hr', gitsigns.reset_hunk, {
        desc = 'Reset hunk under cursor',
      })
      utils.keymap('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Reset selected hunk(s)', buffer = bufnr })

      buf_nmap('<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
      buf_nmap('<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })

      buf_nmap('<leader>hp', function()
        gitsigns.preview_hunk_inline()
        vim.fn['lightline#update']()
      end, { desc = 'Preview hunk under cursor' })

      buf_nmap('<leader>hv', gitsigns.select_hunk, {
        desc = 'Select hunk under cursor',
      })
    end,
    preview_config = {
      border = 'rounded',
    },
  })
end

return {
  'lewis6991/gitsigns.nvim',
  config = config,
  dependencies = { 'itchyny/lightline.vim' },
}
