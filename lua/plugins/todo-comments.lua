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

  local keywords = { 'FIX', 'HACK', 'WARN', 'PERF', 'NOTE', 'TODO', 'TEST' }

  nmap(']T]', function()
    todo_comments.jump_next()
  end, { desc = 'Jump to any next todo comment' })
  nmap('[T[', function()
    todo_comments.jump_prev()
  end, { desc = 'Jump to any previous todo comment' })

  for _, keyword in ipairs(keywords) do
    local letter_idx = string.sub(keyword, 1, 1) == 'T' and 3 or 1

    nmap(']T' .. string.sub(keyword, letter_idx, letter_idx), function()
      todo_comments.jump_next({ keywords = { keyword } })
    end, { desc = 'Jump to next ' .. keyword .. ' comment' })
    nmap('[T' .. string.sub(keyword, letter_idx, letter_idx), function()
      todo_comments.jump_prev({ keywords = { keyword } })
    end, { desc = 'Jump to previous ' .. keyword .. ' comment' })
  end
end

return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = config,
}
