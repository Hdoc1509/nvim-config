return {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
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
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ['<leader>a'] = '@parameter.inner',
    },
    swap_previous = {
      ['<leader>A'] = '@parameter.inner',
    },
  },
}
