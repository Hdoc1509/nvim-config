local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_window_bordered = cmp.config.window.bordered()

cmp.setup({
  snippet = {
    expand = function(args) vim.fn['vsnip#anonymous'](args.body) end,
  },
  window = {
    completion = cmp_window_bordered,
    documentation = cmp_window_bordered,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function(_, vim_item) return vim_item end,
    }),
  },
})
