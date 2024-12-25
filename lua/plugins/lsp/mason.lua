require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    -- See https://mason-registry.dev/registry/list for available tools

    -- SERVERS
    'astro-language-server',
    'bash-language-server',
    'css-lsp',
    'emmet-ls',
    'eslint-lsp',
    'gradle-language-server',
    -- 'groovy-language-server',
    'html-lsp',
    'jdtls',
    'json-lsp',
    'lua-language-server',
    'marksman',
    -- 'mdx-analyzer',
    'typescript-language-server',
    'vim-language-server',
    'yaml-language-server',

    -- FORMATTERS
    'google-java-format',
    'jq',
    'shfmt',
    'stylua',
    'prettier',

    -- LINTERS
    'actionlint',
  },
})
