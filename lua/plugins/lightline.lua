vim.g.lightline = {
  colorscheme = 'powerlineish',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch' },
      { 'readonly', 'filename' },
    },
    right = {
      { 'lineinfo' },
      { 'percent' },
      { 'fileformat', 'fileencoding' },
    },
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
    vim.cmd([[
      " palette table: lua =vim.fn['lightline#palette']()
      let palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
      " [fg, fg_cterm]
      let fg_insert = [palette.insert.right[0][0], palette.insert.right[0][2],]
      let fg_normal = ["#ff7043", 209]
      " [bg, bg_cterm]
      let bg_insert = [palette.insert.right[0][1], palette.insert.right[0][3],]
      let bg_normal = [palette.normal.right[1][1], palette.normal.right[1][3],]
      " [fg, bg, fg_cterm, bg_cterm, style]
      let insert = [fg_insert[0], bg_insert[0], fg_insert[1], bg_insert[1], "bold"]
      let normal = [fg_normal[0], bg_normal[0], fg_normal[1], bg_normal[1], "bold"]

      call insert(palette.insert.left, insert, 1)
      call insert(palette.normal.left, normal, 1)
      call insert(palette.visual.left, normal, 1)
      call insert(palette.replace.left, normal, 1)

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
    ]])
  end,
}
