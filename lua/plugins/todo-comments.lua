local config = function()
  local nmap = require('utils').nmap
  local todo_comments = require('todo-comments')

  todo_comments.setup()

  nmap(']t', todo_comments.jump_next, { desc = 'Jump to next TODO' })
  nmap('[t', todo_comments.jump_prev, { desc = 'Jump to previous TODO' })
end

return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = config,
}
