vim.g.lightline = {
  colorscheme = 'powerlineish',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'readonly', 'filename', 'codeium', 'spell' },
    },
    right = {
      { 'lineinfo' },
      { 'percent' },
      { 'fileformat', 'fileencoding' },
    },
  },
  component = {
    spell = '%{&spell ? "SPELL " .. &spelllang : ""}',
  },
  component_function = {
    -- codeium = 'LightlineCodeium',
    filename = 'LightlineFilename',
    gitbranch = 'FugitiveHead',
    readonly = 'LightlineReadonly',
  },
  enable = { tabline = 0 },
}

return {
  'itchyny/lightline.vim',
  dependencies = {
    'tpope/vim-fugitive',
    -- 'Exafunction/codeium.vim',
  },
  config = function()
    -- stylua: ignore start
    vim.api.nvim_exec2([[
      " function! LightlineCodeium()
      "   return ' ' .. codeium#GetStatusString()
      " endfunction

      function! LightlineFilename()
        let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
        let modified = &modified ? ' +' : ''
        return filename . modified
      endfunction

      function! LightlineReadonly()
        return &readonly && &filetype !=# 'help' ? '' : ''
      endfunction
    ]], {})
    -- stylua: ignore end
  end,
}
