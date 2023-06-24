require('nightfox').setup({
  options = {
    styles = {
      comments = 'italic',
      keywords = 'italic',
    },
  },
  palettes = {
    all = {
      bg0 = '#101010',
      bg1 = '#030303',
      bg3 = '#202020',
      white = '#ffffff',
      green = '#00a600',
      fg1 = '#ffffff',
    },
  },
  groups = {
    all = {
      Cursor = { bg = '#34C6FF' },
      NvimTreeNormal = { bg = '#030303' },
      IndentBlanklineChar = { fg = '#777777', gui = 'nocombine' },
      IndentBlanklineContextChar = { fg = '#777777', gui = 'nocombine' },
      VirtColumn = { fg = '#34C6FF' },
    },
  },
})

vim.cmd('colorscheme carbonfox')
