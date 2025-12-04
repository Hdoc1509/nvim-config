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
      { name = 'lazydev', group_index = 0 },
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
    -- NOTE: until fix for https://github.com/hrsh7th/cmp-nvim-lsp/pull/81
    -- see: https://github.com/hrsh7th/cmp-nvim-lsp/pull/87
    -- check if pin needed once using nvim-0.11
    { 'hrsh7th/cmp-nvim-lsp', commit = 'a8912b88ce488f411177fc8aed358b04dc246d7b' },
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-calc',
    'hrsh7th/vim-vsnip',
    'supermaven-inc/supermaven-nvim',
    'windwp/nvim-autopairs',
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  config = config,
}
