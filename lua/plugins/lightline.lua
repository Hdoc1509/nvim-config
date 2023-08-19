vim.g.lightline = {
  colorscheme = 'powerlineish',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'readonly', 'filename', 'codeium' },
    },
  },
  component = {
    filename = '%t %M',
  },
  component_function = {
    codeium = 'LightlineCodeium',
    gitbranch = 'FugitiveHead',
    readonly = 'LightlineReadonly',
  },
  enable = { tabline = 0 },
}

return {
  'itchyny/lightline.vim',
  dependencies = {
    'tpope/vim-fugitive',
  },
  config = function()
    -- stylua: ignore start
    vim.api.nvim_exec2([[
      function! LightlineCodeium()
        return ' ' .. codeium#GetStatusString()
      endfunction

      function! LightlineReadonly()
        return &readonly && &filetype !=# 'help' ? '' : ''
      endfunction
    ]], {})
    -- stylua: ignore end
  end,
}
