local hover_multi_lsp = require('plugins.lsp.hover-multi-lsp')
local utils = require('utils')
local lsp_buf = vim.lsp.buf
local autocmd = utils.autocmd
local nmap = utils.nmap
local merge = utils.merge

-- LspAttach from :https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
local attach = function(ev)
  local bufnr = ev.buf

  local buf_nmap = function(lhs, rhs, opts)
    nmap(lhs, rhs, merge({ buffer = bufnr }, opts or {}))
  end

  local client = vim.lsp.get_client_by_id(ev.data.client_id)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nmap('grd', function()
    lsp_buf.definition({ reuse_win = true })
  end, { desc = 'Go to definition' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('gO', lsp_buf.document_symbol, { desc = 'List symbols' })
  buf_nmap('J', lsp_buf.signature_help, { desc = 'Show signature help' })
  buf_nmap('K', function()
    hover_multi_lsp(bufnr)
  end, { desc = 'Hover' })
  buf_nmap('grt', lsp_buf.type_definition, { desc = 'Go to type definition' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('grn', lsp_buf.rename, { desc = 'Rename' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('gra', lsp_buf.code_action, { desc = 'Code actions' })
  -- NOTE: not needed from nvim-0.11
  buf_nmap('grr', lsp_buf.references, { desc = 'List references' })

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd('hi clear LspReferenceText')

    local hl_group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })

    -- PERF: try to use single autocmd(). reference:
    -- https://github.com/folke/snacks.nvim/blob/ba529d4f5d409639e082aff916c9b8e71b480531/lua/snacks/words.lua#L40-L52
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
    autocmd({ 'CursorMoved', 'CursorMovedI' }, {
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
