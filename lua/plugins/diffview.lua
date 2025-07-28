local DEFAULT_DIFFOPT = 'internal,filler,closeoff'

local function apply_dynamic_layout()
  if vim.o.columns > 100 then
    vim.o.diffopt = DEFAULT_DIFFOPT .. ',vertical'
  else
    vim.o.diffopt = DEFAULT_DIFFOPT .. ',horizontal'
  end
end

return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewFileHistory', 'DiffviewOpen' },
  config = function()
    require('diffview').setup({
      view = {
        default = { layout = -1 },
        file_history = { layout = -1 },
      },
    })

    vim.keymap.set('n', '<leader>df', function()
      apply_dynamic_layout()

      if vim.v.count > 0 then
        vim.cmd('DiffviewFileHistory --max-count=' .. vim.v.count .. ' %')
      else
        vim.cmd('DiffviewFileHistory %')
      end
    end, { desc = 'Show file history' })

    vim.keymap.set('n', '<leader>db', function()
      apply_dynamic_layout()

      if vim.v.count > 0 then
        vim.cmd('DiffviewFileHistory --max-count=' .. vim.v.count)
      else
        vim.cmd('DiffviewFileHistory')
      end
    end, { desc = 'Show branch history' })

    vim.keymap.set('n', '<leader>D', function()
      apply_dynamic_layout()
      vim.cmd('DiffviewOpen')
    end, { desc = 'Show diffs of current index' })
  end,
  keys = {
    { '<leader>df', nil, desc = 'Show file history' },
    { '<leader>db', nil, desc = 'Show branch history' },
    { '<leader>D', nil, desc = 'Show diffs of current index' },
  },
}
