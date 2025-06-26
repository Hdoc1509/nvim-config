vim.g.vsnip_filetypes = {
  typescript = { 'javascript' },
  typescriptreact = { 'javascript' },
  text = { 'license' },
}

local config = function()
  local cmp = require('cmp')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local lspkind = require('lspkind')
  local cmp_window_bordered = cmp.config.window.bordered()

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

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
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'supermaven' },
      { name = 'calc' },
    }),
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        maxwidth = 50,
        symbol_map = { Supermaven = '' },
        menu = {
          nvim_lsp = '[LSP]',
          vsnip = '[Snippet]',
          path = '[Path]',
          buffer = '[Buffer]',
          supermaven = '[SuperMaven]',
          calc = '[Math]',
          nvim_lsp_document_symbol = '[Symbol]',
        },
        before = function(entry, item)
          if entry.source.name == 'calc' then
            item.kind = ''
          end

          return item
        end,
      }),
    },
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'nvim_lsp_document_symbol' },
      { name = 'buffer' },
    }),
  })

  cmp.setup.cmdline('?', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' },
    }),
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
    {
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      -- NOTE: until update to nvim-0.10
      commit = '7ed09f8b89044976f7866e09a815dcbbab902ae9',
    },
    'hrsh7th/cmp-calc',
    {
      'hrsh7th/vim-vsnip',
      -- NOTE: looks like next update needs new features of nvim-treesitter
      commit = 'b7445b3c43acb08c0b74350d046e0088ece88033',
    },
    'supermaven-inc/supermaven-nvim',
    {
      -- TODO: move to its own file
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        local Rule = require('nvim-autopairs.rule')
        local npairs = require('nvim-autopairs')

        npairs.setup({})

        npairs.add_rules({
          Rule('<% ', ' %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
          Rule('<%=', '  %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
          Rule('<%-', '  %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
          Rule('<%#', '  %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
          Rule('<!--', ' -->', { 'html', 'ejs' }),
          Rule('{/*', '  */', { 'markdown.mdx' }):set_end_pair_length(3),
        })
      end,
    },
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  config = config,
}
