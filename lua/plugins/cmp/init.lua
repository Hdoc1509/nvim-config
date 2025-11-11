local config = function()
  local cmp = require('cmp')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp_window_bordered = cmp.config.window.bordered()

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
    mapping = require('plugins.cmp.mapping'),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'nvim_lsp_signature_help' },
      -- { name = 'path' },
      -- { name = 'buffer' },
      { name = 'supermaven' },
      { name = 'calc' },
    }),
    formatting = {
      format = require('plugins.cmp.format'),
    },
  })

  require('plugins.cmp.cmdline').setup()
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
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-calc',
    {
      'hrsh7th/vim-vsnip',
      -- NOTE: looks like next update needs new features of nvim-treesitter
      commit = 'b7445b3c43acb08c0b74350d046e0088ece88033',
    },
    'supermaven-inc/supermaven-nvim',
    'windwp/nvim-autopairs',
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  config = config,
}
