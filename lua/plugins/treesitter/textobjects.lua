local function setup()
  local textobjects_select = require('nvim-treesitter-textobjects.select')
  local textobjects_swap = require('nvim-treesitter-textobjects.swap')

  local mappings = {
    select = {
      -- TODO: disable temporaryly
      ['ac'] = '@class.outer',
      ['ic'] = '@class.inner',

      ['af'] = '@function.outer',
      ['if'] = '@function.inner',

      ['aF'] = '@call.outer',
      ['iF'] = '@call.inner',

      ['ai'] = '@conditional.outer',
      ['ii'] = '@conditional.inner',

      ['ap'] = '@parameter.outer',
      ['ip'] = '@parameter.inner',

      ['al'] = '@loop.outer',
      ['il'] = '@loop.inner',

      ['ar'] = '@return.outer',
      ['ir'] = '@return.inner',

      ['a='] = '@assignment.outer',
      ['i='] = '@assignment.inner',
    },
    swap_next = {
      ['<leader>a'] = '@parameter.inner',
    },
    swap_previous = {
      ['<leader>A'] = '@parameter.inner',
    },
  }

  require('nvim-treesitter-textobjects').setup({
    select = {
      lookahead = true,
    },
  })

  for lhs, textobject in pairs(mappings.select) do
    vim.keymap.set({ 'x', 'o' }, lhs, function()
      textobjects_select.select_textobject(textobject, 'textobjects')
    end)
  end

  for lhs, textobject in pairs(mappings.swap_next) do
    vim.keymap.set('n', lhs, function()
      textobjects_swap.swap_next(textobject)
    end)
  end

  for lhs, textobject in pairs(mappings.swap_previous) do
    vim.keymap.set('n', lhs, function()
      textobjects_swap.swap_previous(textobject)
    end)
  end
end

return { setup = setup }
