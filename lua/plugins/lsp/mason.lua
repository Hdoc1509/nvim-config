require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    -- See https://mason-registry.dev/registry/list for available tools

    -- SERVERS
    { 'ast-grep', version = '0.32.2' },
    { 'astro-language-server', version = '2.10.0' },
    { 'bash-language-server', version = '5.4.0' },
    { 'css-lsp', version = '4.7.0' },
    { 'emmet-ls', version = '0.4.2' },
    { 'eslint-lsp', version = '4.8.0' },
    { 'gradle-language-server', version = '3.15.0' },
    -- 'groovy-language-server',
    { 'html-lsp', version = '4.7.0' },
    { 'jdtls', version = 'v1.43.0' },
    { 'json-lsp', version = '4.8.0' },
    { 'lua-language-server', version = '3.9.3' },
    { 'marksman', version = '2023-12-09' },
    -- 'mdx-analyzer',
    { 'typescript-language-server', version = '4.3.3' },
    { 'vim-language-server', version = '2.3.1' },
    { 'yaml-language-server', version = '1.15.0' },

    -- FORMATTERS
    { 'google-java-format', version = 'v1.25.2' },
    { 'jq', version = 'jq-1.7' },
    { 'prettier', version = '3.0.3' },
    { 'shfmt', version = 'v3.7.0' },
    { 'stylua', version = 'v0.18.1' },

    -- LINTERS
    { 'actionlint', version = 'v1.7.1' },
  },
})
