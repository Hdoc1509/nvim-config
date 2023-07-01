local utils = require('utils')
local nmap = utils.nmap
local merge = utils.merge

local api = vim.api
local diagnostic = vim.diagnostic

return function(client, bufnr)
  local buf_nmap = function(lhs, rhs, opts)
    nmap(lhs, rhs, merge({ buffer = bufnr }, opts or {}))
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nmap('gd', vim.lsp.buf.definition)
  buf_nmap('<Leader>ds', vim.lsp.buf.document_symbol)
  buf_nmap('J', vim.lsp.buf.signature_help)
  buf_nmap('K', vim.lsp.buf.hover)
  buf_nmap('<space>D', vim.lsp.buf.type_definition)
  buf_nmap('<space>rn', vim.lsp.buf.rename)
  buf_nmap('<space>ca', vim.lsp.buf.code_action)
  buf_nmap('gr', vim.lsp.buf.references)
  buf_nmap('[d', vim.diagnostic.goto_prev)
  buf_nmap(']d', vim.diagnostic.goto_next)

  -- Show inline diagnostic automatically in Hover Window
  api.nvim_create_autocmd('CursorHold', {
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
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = api.nvim_win_get_cursor(0)
      if
        (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
        and #diagnostic.get() > 0
      then
        diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
    ]])

    local gid = api.nvim_create_augroup('lsp_document_highlight', { clear = true })
    api.nvim_create_autocmd('CursorHold', {
      group = gid,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    api.nvim_create_autocmd('CursorMoved', {
      group = gid,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end
