local config = function()
  local nmap = require('utils').nmap
  local todo_comments = require('todo-comments')
  local todo_search = require('todo-comments.search')

  todo_comments.setup({
    keywords = {
      TEST = { icon = '' },
    },
  })

  -- Listing
  -- TODO: add to README.md
  nmap('<leader>TL', '<cmd>TodoQuickFix<cr>', { desc = 'List all TODO comments' })

  -- TODO: use this to select  HACK   NOTE   PERF   TEST   TODO   WARN
  -- nmap('Tl', function() ... end, { desc = 'List selected TODO comments'})
  --[[ vim.ui.select({ 'tabs', 'spaces' }, {
    prompt = 'Select tabs or spaces:',
    format_item = function(item)
      return "I'd like to choose " .. item
    end,
  }, function(choice)
    if choice == 'spaces' then
      -- vim.o.expandtab = true
      print('you selected spaces')
    else
      -- vim.o.expandtab = false
      print('you selected tabs')
    end
  end) ]]

  -- TODO: add to README.md
  nmap('<leader>TT', function()
    todo_search.setqflist({ keywords = 'TODO' })
  end, { desc = 'List only TODO comments' })
  nmap('<leader>TN', function()
    todo_search.setqflist({ keywords = 'NOTE' })
  end, { desc = 'List only NOTE comments' })

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
