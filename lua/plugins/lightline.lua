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

      " TODO: update colors for rest of modes
      " [fg, bg, fg_cterm, bg_cterm, style]
      " bg -> 2nd item in `right` section
      let s:palette.normal.left[1] = ["#ff7043", "#262626", 209, 235, "bold"]

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
        let branch = gitbranch#name()
        return branch !=# '' ? branch . ' 󰘬' : ''
      endfunction
    ]], {})
    -- stylua: ignore end
  end,
}
