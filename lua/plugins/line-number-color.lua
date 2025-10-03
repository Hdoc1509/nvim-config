return {
  'sethen/line-number-change-mode.nvim',
  dependencies = {
    'itchyny/lightline.vim',
  },
  config = function()
    local colorscheme = vim.g.lightline.colorscheme
    local palette = vim.g['lightline#colorscheme#' .. colorscheme .. '#palette']

    require('line-number-change-mode').setup({
      mode = {
        i = {
          fg = palette.insert.left[1][1],
          bg = palette.insert.left[1][2],
          bold = true,
        },
        n = {
          fg = palette.normal.left[1][1],
          bg = palette.normal.left[1][2],
          bold = true,
        },
        R = {
          fg = palette.replace.left[1][1],
          bg = palette.replace.left[1][2],
          bold = true,
        },
        v = {
          fg = palette.visual.left[1][1],
          bg = palette.visual.left[1][2],
          bold = true,
        },
        V = {
          fg = palette.visual.left[1][1],
          bg = palette.visual.left[1][2],
          bold = true,
        },
      },
    })
  end,
}
