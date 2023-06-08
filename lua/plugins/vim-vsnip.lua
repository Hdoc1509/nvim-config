-- Jump fordward
vim.cmd([[inoremap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']])
vim.cmd([[snoremap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']])

-- Jump backward
vim.cmd([[inoremap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']])
vim.cmd([[snoremap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']])

vim.g.vsnip_filetypes = {
  typescript = { 'javascript' },
}
