local create_buf_nmapper = require("utils").create_buf_nmapper

local api = vim.api
local diagnostic = vim.diagnostic

return function(client, bufnr)
  local buf_nmap = create_buf_nmapper(bufnr)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  buf_nmap('<Leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  buf_nmap('J', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf_nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  buf_nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  buf_nmap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf_nmap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  buf_nmap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  buf_nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  buf_nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  buf_nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

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
