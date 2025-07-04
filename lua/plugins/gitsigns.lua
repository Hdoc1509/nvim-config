local config = function()
  local gitsigns = require('gitsigns')
  local utils = require('utils')
  local nmap = utils.nmap
  local merge = utils.merge
  local keymap = utils.keymap

  gitsigns.setup({
    on_attach = function(bufnr)
      local buf_nmap = function(lhs, rhs, opts)
        nmap(lhs, rhs, merge({ buffer = bufnr }, opts or {}))
      end

      local buf_keymap = function(mode, lhs, rhs, opts)
        keymap(mode, lhs, rhs, merge({ buffer = bufnr }, opts or {}))
      end

      buf_nmap(']c', function()
        gitsigns.nav_hunk('next')
      end, { desc = 'Jump to next hunk' })

      buf_nmap('[c', function()
        gitsigns.nav_hunk('prev')
      end, { desc = 'Jump to previous hunk' })

      buf_nmap('<leader>hs', gitsigns.stage_hunk, { desc = 'Stage/unstage hunk under cursor' })
      buf_keymap('v', '<leader>hs', function()
        gitsigns.stage_hunk({
          vim.fn.line('.'),
          vim.fn.line('v'),
        })
      end, { desc = 'Stage/unstage selected hunk(s)' })

      buf_nmap('<Leadaer>hr', gitsigns.reset_hunk, { desc = 'Reset hunk under cursor' })
      buf_keymap('v', '<leader>hr', function()
        gitsigns.reset_hunk({
          vim.fn.line('.'),
          vim.fn.line('v'),
        })
      end, { desc = 'Reset selected hunk(s)' })

      buf_nmap('<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
      buf_nmap('<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
      buf_nmap('<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk under cursor' })
      buf_nmap('<leader>hP', gitsigns.preview_hunk_inline, { desc = 'Preview hunk under cursor but inline' })
      buf_nmap('<leader>hv', gitsigns.select_hunk, { desc = 'Select hunk under cursor' })
    end,
    preview_config = {
      border = 'rounded',
    },
  })
end

return {
  'lewis6991/gitsigns.nvim',
  config = config,
}
