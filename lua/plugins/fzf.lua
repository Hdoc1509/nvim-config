return {
  {
    'junegunn/fzf',
    build = './install --bin', -- ensure latest version for neovim
    keys = {
      { '<leader>sf', '<cmd>FZF<cr>', desc = 'Search files' },
    },
  },
  {
    'junegunn/fzf.vim',
    dependencies = 'junegunn/fzf',
    keys = {
      { '<leader>sb', '<cmd>Buffers<cr>', desc = 'Search buffers' },
      { '<leader>s?', '<cmd>Helptags<cr>', desc = 'Search helptags' },
      { '<leader>st', '<cmd>Rg<cr>', desc = 'Search files by text' },
      { '<leader>ss', '<cmd>GFiles?<cr>', desc = 'Search files by git status' },
    },
  },
}
