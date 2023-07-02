local keymap = require('utils').keymap

-- Jump forward
keymap({ 'i', 's' }, '<Tab>', function()
  return vim.fn['vsnip#jumpable'](1) == 1 and '<Plug>(vsnip-jump-next)' or '<Tab>'
end, { expr = true })

-- Jump backward
keymap({ 'i', 's' }, '<S-Tab>', function()
  return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<S-Tab>'
end, { expr = true })

vim.g.vsnip_filetypes = {
  typescript = { 'javascript' },
}
