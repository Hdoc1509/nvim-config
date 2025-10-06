local lsp_log = require('vim.lsp.log')
local hover_multi_lsp = require('plugins.lsp.hover-multi-lsp')
local utils = require('utils')
local lsp_buf = vim.lsp.buf
local autocmd = utils.autocmd
local nmap = utils.nmap
local merge = utils.merge
local map_notify = utils.map_notify

-- LspAttach from :https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
local attach = function(ev)
  local buf_nmap = function(lhs, rhs, opts)
    nmap(lhs, rhs, merge({ buffer = ev.buf }, opts or {}))
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nmap('grd', function()
    lsp_buf.definition({ reuse_win = true })
  end, { desc = 'Go to definition' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('gO', lsp_buf.document_symbol, { desc = 'List symbols' })
  buf_nmap('J', lsp_buf.signature_help, { desc = 'Show signature help' })
  buf_nmap('K', function()
    hover_multi_lsp(ev.buf)
  end, { desc = 'Hover' })
  buf_nmap('grt', lsp_buf.type_definition, { desc = 'Go to type definition' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('grn', lsp_buf.rename, { desc = 'Rename' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('gra', lsp_buf.code_action, { desc = 'Code actions' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('grr', lsp_buf.references, { desc = 'List references' })

  -- NOTE: you can create user commands for specific LSP server
  -- see :help lspconfig-configurations
end

return {
  setup = function()
    autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = attach,
    })

    nmap('<leader>ll', function()
      if lsp_log.get_level() == vim.lsp.log_levels.OFF then
        vim.lsp.set_log_level('debug')
        map_notify('LSP log enabled')
      else
        vim.lsp.set_log_level('off')
        map_notify('LSP log disabled')
      end
    end, { desc = 'Toggle LSP log' })
  end,
}
