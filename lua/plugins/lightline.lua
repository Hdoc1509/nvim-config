vim.g.lightline = {
  colorscheme = 'powerlineish',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch' },
      { 'readonly', 'filename', 'spell' },
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
    gitbranch = 'LightlineGitBranch',
    readonly = 'LightlineReadonly',
  },
  enable = { tabline = 0 },
}

return {
  'itchyny/lightline.vim',
  dependencies = {
    'itchyny/vim-gitbranch',
  },
  config = function()
    -- stylua: ignore start
    vim.api.nvim_exec2([[
      " palette table: print(vim.inspect(vim.fn['lightline#palette']()))
      let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette

      " #ff7043 inactive
      " update color for 2nd section of left section
      " TODO: update colors for rest of modes
      let s:palette.normal.left[1] = ["#e8e8e8", "#f54d27", 231, 214, "bold"]
      " let s:palette.normal.left[1] = ["#f54d27", "#e8e8e8", 231, 214, "bold"]

      " create colors for 3rd sub-section of left section
      call add(s:palette.normal.left, ["#ffffff", "#121212", 231, 233])

      function! LightlineFilename()
        let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
        let modified = &modified ? ' +' : ''
        return filename . modified
      endfunction

      function! LightlineReadonly()
        return &readonly && &filetype !=# 'help' ? '' : ''
      endfunction

      function! LightlineGitBranch()
        return gitbranch#name() . ' 󰘬'
      endfunction
    ]], {})
    -- stylua: ignore end
  end,
}
