return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewFileHistory', 'DiffviewOpen' },
  keys = {
    -- TODO: use vim.v.count to limit number of commits to show
    -- TODO: call in horizontal split
    { '<leader>df', '<cmd>DiffviewFileHistory %<cr>', desc = 'Show file history' },
    { '<leader>db', '<cmd>DiffviewFileHistory<cr>', desc = 'Show branch history' },
    { '<leader>D', '<cmd>DiffviewOpen', desc = 'Show diffs of current index' },
  },
}
