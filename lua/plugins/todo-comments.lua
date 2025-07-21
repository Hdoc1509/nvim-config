local config = function()
  local nmap = require('utils').nmap
  local todo_comments = require('todo-comments')
  local todo_search = require('todo-comments.search')

  local keywords = { 'FIX', 'HACK', 'WARN', 'PERF', 'NOTE', 'TODO', 'TEST' }

  todo_comments.setup({
    keywords = {
      TEST = { icon = '' },
    },
  })

  nmap(']T]', todo_comments.jump_next, { desc = 'Jump to any next todo comment' })
  nmap('[T[', todo_comments.jump_prev, { desc = 'Jump to any previous todo comment' })
  nmap('<leader>TL', '<cmd>TodoQuickFix<cr>', { desc = 'List all todo comments' })

  for _, keyword in ipairs(keywords) do
    local letter_idx = string.sub(keyword, 1, 1) == 'T' and 3 or 1

    nmap(']T' .. string.sub(keyword, letter_idx, letter_idx), function()
      todo_comments.jump_next({ keywords = { keyword } })
    end, { desc = 'Jump to next ' .. keyword .. ' comment' })
    nmap('[T' .. string.sub(keyword, letter_idx, letter_idx), function()
      todo_comments.jump_prev({ keywords = { keyword } })
    end, { desc = 'Jump to previous ' .. keyword .. ' comment' })
    nmap('<leader>T' .. string.sub(keyword, letter_idx, letter_idx), function()
      todo_search.setqflist({ keywords = keyword })
    end, { desc = 'List ' .. keyword .. ' comments' })
  end
end

return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = config,
}
