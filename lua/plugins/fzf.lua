return {
  {
    'junegunn/fzf',
    build = './install --bin', -- ensure latest version for neovim
    keys = {
      { '<leader>e', '<cmd>FZF<cr>' },
    },
  },
  {
    'junegunn/fzf.vim',
    dependencies = 'junegunn/fzf',
    keys = {
      { '<leader>E', '<cmd>Buffers<cr>' },
      { '<leader>?', '<cmd>Helptags<cr>' },
      { '<leader>R', '<cmd>Rg<cr>' },
      { '<leader>D', '<cmd>GFiles?<cr>' },
    },
  },
}
