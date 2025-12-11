local hover_multi_lsp = require('plugins.lsp.hover-multi-lsp')
local utils = require('utils')
local lsp_buf = vim.lsp.buf
local autocmd = utils.autocmd
local nmap = utils.nmap
local merge = utils.merge

-- see :h LspAttach
local attach = function(ev)
  local bufnr = ev.buf

  local buf_nmap = function(lhs, rhs, opts)
    nmap(lhs, rhs, merge({ buffer = bufnr }, opts or {}))
  end

  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client == nil then
    return
  end

  -- see `:help vim.lsp.*` for documentation on any of the below functions
  buf_nmap('grd', function()
    lsp_buf.definition({ reuse_win = true })
  end, { desc = 'Go to definition' })
  buf_nmap('J', lsp_buf.signature_help, { desc = 'Show signature help' })
  buf_nmap('K', function()
    hover_multi_lsp(bufnr)
  end, { desc = 'Hover' })
  buf_nmap('grt', lsp_buf.type_definition, { desc = 'Go to type definition' })
  buf_nmap('grn', ':IncRename ', { desc = 'Rename' })

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd('hi clear LspReferenceText')

    local hl_group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })

    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = hl_group })
    autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = hl_group,
      buffer = bufnr,
      callback = function()
        local ts_captures = vim.treesitter.get_captures_at_cursor(0)

        if not vim.tbl_contains(ts_captures, 'string') then
          lsp_buf.document_highlight()
        end
      end,
    })
    autocmd({ 'CursorMoved', 'CursorMovedI', 'WinLeave' }, {
      group = hl_group,
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
