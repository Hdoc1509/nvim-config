vim.g.vsnip_filetypes = {
  typescript = { 'javascript' },
  typescriptreact = { 'javascript' },
  text = { 'license' },
}

local config = function()
  local cmp = require('cmp')
  local cmp_context = require('cmp.config.context')
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
      ['<Tab>'] = cmp.mapping(function(fallback)
        if vim.fn['vsnip#jumpable'](1) == 1 then
          feedkey('<Plug>(vsnip-jump-next)', '')
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if vim.fn['vsnip#jumpable'](-1) == 1 then
          feedkey('<Plug>(vsnip-jump-prev)', '')
        else
          fallback()
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
    enabled = function()
      -- disable completion in comments
      -- See https://github.com/hrsh7th/nvim-cmp/pull/676#issuecomment-1002532096
      if cmp_context.in_treesitter_capture('comment') == true or cmp_context.in_syntax_group('Comment') then
        return false
      else
        return true
      end
    end,
  })
end

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-vsnip',
    'rafamadriz/friendly-snippets',
    'hrsh7th/vim-vsnip',
  },
  event = 'VeryLazy',
  config = config,
}
