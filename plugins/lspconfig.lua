local nvim_lsp = require('lspconfig')
local fn = vim.fn
local api = vim.api
local diagnostic = vim.diagnostic
local servers =
  { 'bashls', 'cssls', 'eslint', 'html', 'jsonls', 'marksman', 'sumneko_lua', 'taplo', 'tsserver', 'vimls', 'yamlls' }

local merge = function(...) return vim.tbl_deep_extend('force', ...) end

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

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
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP GENERAL SETTINGS
local lsp_general_settings = {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- LUA SETTINGS
local lua_settings = {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
}

-- BASH SETTINGS
local bash_settings = {
  filetypes = {
    'sh',
    'zsh',
  },
}

for _, lsp in ipairs(servers) do
  if lsp == 'sumneko_lua' then
    nvim_lsp[lsp].setup(merge(lsp_general_settings, lua_settings))
  elseif lsp == 'bashls' then
    nvim_lsp[lsp].setup(merge(lsp_general_settings, bash_settings))
  else
    nvim_lsp[lsp].setup(lsp_general_settings)
  end
end

-- Change diagnostic signs
fn.sign_define('DiagnosticSignError', { text = '???', texthl = 'DiagnosticSignError' })
fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
fn.sign_define('DiagnosticSignInformation', { text = '???', texthl = 'DiagnosticSignInfo' })
fn.sign_define('DiagnosticSignHint', { text = '???', texthl = 'DiagnosticSignHint' })
