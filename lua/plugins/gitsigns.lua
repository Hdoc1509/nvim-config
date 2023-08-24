local config = function()
  local gitsigns = require('gitsigns')
  local utils = require('utils')
  local nmap = utils.nmap
  local merge = utils.merge

  gitsigns.setup({
    on_attach = function(bufnr)
      local buf_nmap = function(lhs, rhs, opts)
        nmap(lhs, rhs, merge({ buffer = bufnr }, opts or {}))
      end

      buf_nmap(']c', gitsigns.next_hunk, { desc = 'Jump to next hunk' })
      buf_nmap('[c', gitsigns.prev_hunk, { desc = 'Jump to previous hunk' })
      buf_nmap('<Leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
      buf_nmap('<Leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
      buf_nmap('<Leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
      buf_nmap('<Leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
    end,
  })
end

return {
  'lewis6991/gitsigns.nvim',
  config = config,
}
