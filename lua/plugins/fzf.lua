-- TODO: override `FZF_DEFAULT_OPTS` per keymap
-- Buffers -> no preview
-- Helptags -> no preview
-- Rg -> preview-window right,50%,<50(down,50%)
-- GFiles? -> preview-window right,50%,<50(down,50%)
-- BCommits -> preview-window right,50%,<50(down,50%)
return {
  {
    'junegunn/fzf',
    build = './install --bin', -- ensure latest version for neovim
    keys = {
      { '<leader>sf', nil, desc = 'Search files' },
    },
    config = function()
      local WINDOW_HEIGHT = 0.6

      vim.keymap.set('n', '<leader>sf', function()
        if vim.o.columns > 100 then
          vim.g.fzf_layout = {
            window = { width = 100, height = WINDOW_HEIGHT },
          }
        else
          vim.g.fzf_layout = {
            window = { width = 0.9, height = WINDOW_HEIGHT },
          }
        end

        vim.cmd('FZF')
      end, { desc = 'Search files' })
    end,
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
