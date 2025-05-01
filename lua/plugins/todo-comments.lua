local config = function()
  local nmap = require('utils').nmap
  local todo_comments = require('todo-comments')

  todo_comments.setup({
    keywords = {
      TEST = { icon = '' },
    },
  })

  nmap(']T', function()
    todo_comments.jump_next({ keywords = { 'TODO' } })
  end, { desc = 'Jump to next TODO comment' })
  nmap('[T', function()
    todo_comments.jump_prev({ keywords = { 'TODO' } })
  end, { desc = 'Jump to previous TODO comment' })
end

return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = config,
}
