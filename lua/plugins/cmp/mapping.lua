local cmp = require('cmp')

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return cmp.mapping.preset.insert({
  ['<C-h>'] = cmp.mapping(function()
    if vim.fn['vsnip#jumpable'](-1) == 1 then
      feedkey('<Plug>(vsnip-jump-prev)', '')
    end
  end, { 'i', 's' }),
  ['<C-l>'] = cmp.mapping(function()
    if vim.fn['vsnip#jumpable'](1) == 1 then
      feedkey('<Plug>(vsnip-jump-next)', '')
    end
  end, { 'i', 's' }),
  ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item()),
  ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item()),
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-s>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<C-n>'] = cmp.config.disable,
  ['<C-p>'] = cmp.config.disable,
})
