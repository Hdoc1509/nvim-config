local utils = require('utils')
local lsp_attach = require('plugins.lsp.attach')
local merge = utils.merge
local nvim_lsp = require('lspconfig')
local fn = vim.fn
local servers = {
  'bashls',
  'cssls',
  'eslint',
  'emmet_ls',
  'html',
  'jsonls',
  'lua_ls',
  'marksman',
  'tsserver',
  'vimls',
  'yamlls',
}

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  }),
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- LSP GENERAL SETTINGS
local lsp_general_settings = {
  on_attach = lsp_attach,
  capabilities = capabilities,
  handlers = handlers,
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

-- JSON SETTINGS
local select_schemas = {
  '.eslintrc',
  'package.json',
}

local json_settings = {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas({
        select = select_schemas,
      }),
      validate = { enable = true },
    },
  },
}

-- YAML SETTINGS
local yaml_settings = {
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas({
        select = {
          'GitHub Workflow',
        },
      }),
    },
  },
}

for _, lsp in ipairs(servers) do
  if lsp == 'lua_ls' then
    nvim_lsp[lsp].setup(merge(lsp_general_settings, lua_settings))
  elseif lsp == 'bashls' then
    nvim_lsp[lsp].setup(merge(lsp_general_settings, bash_settings))
  elseif lsp == 'jsonls' then
    nvim_lsp[lsp].setup(merge(lsp_general_settings, json_settings))
  elseif lsp == 'yamlls' then
    nvim_lsp[lsp].setup(merge(lsp_general_settings, yaml_settings))
  else
    nvim_lsp[lsp].setup(lsp_general_settings)
  end
end

-- Change diagnostic signs
fn.sign_define('DiagnosticSignError', { text = '✗', texthl = 'DiagnosticSignError' })
fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })
fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
