local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_window_bordered = cmp.config.window.bordered()

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  window = {
    completion = cmp_window_bordered,
    documentation = cmp_window_bordered,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = function(fallback)
      if vim.fn['vsnip#jumpable'](1) == 1 then
        feedkey('<Plug>(vsnip-jump-next)', '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn['vsnip#jumpable'](1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      else
        fallback()
      end
    end,
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item()),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-s>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'nvim_lsp_signature_help' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function(_, vim_item)
        return vim_item
      end,
    }),
  },
})
