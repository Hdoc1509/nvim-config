require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    -- See https://mason-registry.dev/registry/list for available tools

    -- CLI
    { 'tree-sitter-cli', version = 'v0.25.6' }, -- needed for tree-sitter-test

    -- LSP
    { 'ast-grep', version = '0.32.2' },
    { 'astro-language-server', version = '2.10.0' },
    { 'bash-language-server', version = '5.4.0' },
    { 'css-variables-language-server', version = '2.7.0' },
    { 'css-lsp', version = '4.7.0' },
    { 'emmet-ls', version = '0.4.2' },
    { 'eslint-lsp', version = '4.8.0' },
    { 'gh-actions-language-server', version = '0.0.3' },
    { 'gradle-language-server', version = '3.15.0' },
    { 'html-lsp', version = '4.7.0' },
    { 'jdtls', version = 'v1.46.1' },
    { 'json-lsp', version = '4.8.0' },
    { 'jq-lsp', version = 'v0.1.11' },
    { 'lua-language-server', version = '3.9.3' },
    { 'marksman', version = '2023-12-09' },
    -- 'mdx-analyzer',
    { 'some-sass-language-server', version = '2.2.1' },
    { 'superhtml', version = 'v0.5.3' },
    { 'ts_query_ls', version = 'v3.3.0' },
    { 'typescript-language-server', version = '4.3.3' },
    { 'typos-lsp', version = 'v0.1.39' },
    { 'vim-language-server', version = '2.3.1' },
    { 'yaml-language-server', version = '1.15.0' },

    -- FORMATTERS
    { 'google-java-format', version = 'v1.25.2' },
    { 'jq', version = 'jq-1.7' },
    -- { 'kulala-fmt', version = '2.10.0' },
    { 'prettier', version = '3.0.3' },
    { 'shfmt', version = 'v3.7.0' },
    { 'stylua', version = 'v0.18.1' },

    -- LINTERS
    { 'actionlint', version = 'v1.7.1' },
    { 'npm-groovy-lint', version = '15.0.2' },
    { 'markdownlint', version = '0.43.0' },
    { 'selene', version = '0.28.0' },
  },
})
