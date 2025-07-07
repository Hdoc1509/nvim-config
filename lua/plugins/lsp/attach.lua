local hover_multi_lsp = require('plugins.lsp.hover-multi-lsp')
local utils = require('utils')
local autocmd = utils.autocmd
local nmap = utils.nmap
local merge = utils.merge

local api = vim.api
local diagnostic = vim.diagnostic
local lsp_buf = vim.lsp.buf

-- LspAttach from :https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
local attach = function(ev)
  local bufnr = ev.buf
  local client = vim.lsp.get_client_by_id(ev.data.client_id)

  local buf_nmap = function(lhs, rhs, opts)
    nmap(lhs, rhs, merge({ buffer = bufnr }, opts or {}))
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nmap('gd', function()
    lsp_buf.definition({ reuse_win = true })
  end)
  buf_nmap('<leader>ds', lsp_buf.document_symbol)
  buf_nmap('J', lsp_buf.signature_help)
  buf_nmap('K', function()
    hover_multi_lsp(bufnr)
  end)
  buf_nmap('<space>D', lsp_buf.type_definition)
  buf_nmap('<space>rn', lsp_buf.rename)
  buf_nmap('<space>ca', lsp_buf.code_action)
  buf_nmap('gr', lsp_buf.references)

  -- show diagnostic on floating window
  autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
        border = 'rounded',
        source = 'always', -- show source in diagnostic popup window
        prefix = ' ',
      }

      if not vim.b.diagnostics_pos then
        ---@diagnostic disable-next-line: inject-field
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = api.nvim_win_get_cursor(0)
      if
        (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
        and #diagnostic.get() > 0
      then
        diagnostic.open_float(nil, float_opts)
      end

      ---@diagnostic disable-next-line: inject-field
      vim.b.diagnostics_pos = cursor_pos
    end,
  })

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
  end,
}
