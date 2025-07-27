local hover_multi_lsp = require('plugins.lsp.hover-multi-lsp')
local utils = require('utils')
local lsp_buf = vim.lsp.buf
local autocmd = utils.autocmd
local nmap = utils.nmap
local merge = utils.merge
local map_notify = utils.map_notify

local lsp_log_enabled = false

-- LspAttach from :https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
local attach = function(ev)
  local bufnr = ev.buf
  local client = vim.lsp.get_client_by_id(ev.data.client_id)

  local buf_nmap = function(lhs, rhs, opts)
    nmap(lhs, rhs, merge({ buffer = bufnr }, opts or {}))
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nmap('grd', function()
    lsp_buf.definition({ reuse_win = true })
  end)
  buf_nmap('gO', lsp_buf.document_symbol) -- NOTE: not needed from nvim-0.11
  buf_nmap('J', lsp_buf.signature_help)
  buf_nmap('K', function()
    hover_multi_lsp(bufnr)
  end)
  buf_nmap('grt', lsp_buf.type_definition)
  buf_nmap('grn', lsp_buf.rename) -- NOTE: not needed from nvim-0.11
  buf_nmap('gra', lsp_buf.code_action) -- NOTE: not needed from nvim-0.11
  buf_nmap('grr', lsp_buf.references) -- NOTE: not needed from nvim-0.11

  -- From: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#highlight-symbol-under-cursor
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
    ]])

    vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = lsp_buf.document_highlight,
    })
    autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = lsp_buf.clear_references,
    })
  end

  -- NOTE: you can create user commands for specific LSP server
  -- see :help lspconfig-configurations
end

return {
  setup = function()
    autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = attach,
    })

    vim.lsp.set_log_level('off')

    nmap('<leader>ll', function()
      if lsp_log_enabled then
        vim.lsp.set_log_level('off')
        map_notify('LSP log disabled')
      else
        vim.lsp.set_log_level('debug')
        map_notify('LSP log enabled')
      end
    end, { desc = 'Toggle LSP log' })
  end,
}
