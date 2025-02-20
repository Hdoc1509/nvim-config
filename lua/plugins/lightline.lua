vim.g.lightline = {
  colorscheme = 'powerlineish',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'readonly', 'filename', 'spell' },
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
    filename = 'LightlineFilename',
    -- TODO: highlight with green color
    gitbranch = 'LightlineGitBranch',
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
      function! LightlineFilename()
        let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
        let modified = &modified ? ' +' : ''
        return filename . modified
      endfunction

      function! LightlineReadonly()
        return &readonly && &filetype !=# 'help' ? '' : ''
      endfunction

      function! LightlineGitBranch()
        return FugitiveHead() . ' 󰘬'
      endfunction
    ]], {})
    -- stylua: ignore end
  end,
}
