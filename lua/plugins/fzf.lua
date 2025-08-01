local DEFAULT_LAYOUT = {
  window = { width = 0.9, height = 0.6 },
}
local PREVIEW_CONFIG = { 'right,50%,<70(down)' }

local function apply_dynamic_layout()
  if vim.o.columns > 100 then
    vim.g.fzf_layout = {
      window = { width = 100, height = DEFAULT_LAYOUT.window.height },
    }
  else
    vim.g.fzf_layout = DEFAULT_LAYOUT
  end

  vim.g.fzf_vim = { preview_window = {} }
end

local function apply_dynamic_preview_window()
  vim.g.fzf_vim = { preview_window = PREVIEW_CONFIG }
  vim.g.fzf_layout = {
    window = { width = 0.9, height = 0.75 },
  }
end

return {
  {
    'junegunn/fzf',
    build = './install --bin', -- ensure latest version for neovim
    keys = {
      { '<leader>sf', nil, desc = 'Search files' },
    },
    config = function()
      if string.match(vim.env.FZF_DEFAULT_OPTS, '%-%-wrap') == nil then
        vim.env.FZF_DEFAULT_OPTS = vim.env.FZF_DEFAULT_OPTS .. ' --wrap'
      end

      vim.keymap.set('n', '<leader>sf', function()
        apply_dynamic_layout()
        vim.cmd('FZF')
      end, { desc = 'Search files' })
    end,
  },
  {
    'junegunn/fzf.vim',
    dependencies = 'junegunn/fzf',
    config = function()
      local nmap = require('utils').nmap

      nmap('<leader>sb', function()
        apply_dynamic_layout()
        vim.cmd('Buffers')
      end, { desc = 'Search buffers' })

      nmap('<leader>s?', function()
        apply_dynamic_layout()
        vim.cmd('Helptags')
      end, { desc = 'Search helptags' })

      nmap('<leader>st', function()
        apply_dynamic_preview_window()
        vim.cmd('Rg')
      end, { desc = 'Search files by text' })

      nmap('<leader>ss', function()
        apply_dynamic_preview_window()
        vim.cmd('GFiles?')
      end, { desc = 'Search files by git status' })

      nmap('<leader>s:', function()
        apply_dynamic_layout()
        vim.cmd('History:')
      end, { desc = 'Search command history' })
    end,
    keys = {
      { '<leader>sb', nil, desc = 'Search buffers' },
      { '<leader>s?', nil, desc = 'Search helptags' },
      { '<leader>st', nil, desc = 'Search files by text' },
      { '<leader>ss', nil, desc = 'Search files by git status' },
      { '<leader>s:', nil, desc = 'Search command history' },
    },
  },
}
