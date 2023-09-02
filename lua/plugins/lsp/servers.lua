local merge = require('utils').merge
local lsp_attach = require('plugins.lsp.attach')

local lsp = vim.lsp

local handlers = {
  ['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
    border = 'rounded',
  }),
  ['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
    border = 'rounded',
  }),
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- LSP GENERAL SETTINGS
local default_settings = {
  on_attach = lsp_attach,
  capabilities = capabilities,
  handlers = handlers,
}

return {
  ['bashls'] = merge(default_settings, {
    filetypes = {
      'sh',
      'zsh',
    },
  }),
  ['cssls'] = default_settings,
  ['emmet_ls'] = merge(default_settings, {
    filetypes = { 'markdown' },
    root_dir = function()
      return vim.loop.cwd()
    end,
  }),
  ['eslint'] = default_settings,
  ['html'] = default_settings,
  ['jsonls'] = merge(default_settings, {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas({
          select = { '.eslintrc', 'package.json', 'tsconfig.json' },
          replace = {
            ['tsconfig.json'] = {
              description = 'Custom JSON schema for typescript configuration files',
              fileMatch = { 'tsconfig*.json' },
              name = 'tsconfig.json',
              url = 'https://json.schemastore.org/tsconfig.json',
            },
          },
        }),
        validate = { enable = true },
      },
    },
  }),
  ['lua_ls'] = merge(default_settings, {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
      },
    },
  }),
  ['marksman'] = default_settings,
  ['tsserver'] = default_settings,
  ['vimls'] = default_settings,
  ['yamlls'] = merge(default_settings, {
    settings = {
      yaml = {
        schemas = require('schemastore').yaml.schemas({
          select = { 'GitHub Workflow' },
        }),
      },
    },
  }),
}
