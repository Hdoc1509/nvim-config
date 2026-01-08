local config = function()
  local util = require('formatter.util')
  local prettier = require('formatter.defaults.prettier')
  local shfmt = require('formatter.filetypes.sh').shfmt

  require('formatter').setup({
    filetype = {
      astro = { prettier }, -- NOTE: requires prettier-plugin-astro
      conf = { shfmt },
      css = { prettier },
      ejs = { prettier }, -- NOTE: requires prettier-plugins-ejs
      groovy = {
        function()
          return {
            exe = 'npm-groovy-lint',
            args = { '--format' },
          }
        end,
      },
      html = { prettier },
      http = {
        function()
          return {
            exe = 'kulala-fmt',
            args = { 'format' },
          }
        end,
      },
      java = { require('formatter.filetypes.java').google_java_format },
      javascript = { prettier },
      javascriptreact = { prettier },
      json = { prettier },
      jsonc = { prettier },
      lua = { require('formatter.filetypes.lua').stylua },
      markdown = {
        prettier,
        -- cbfmt
        function()
          return {
            exe = 'cbfmt',
            args = {
              '--write',
              '--best-effort',
              '--stdin-filepath',
              util.escape_path(util.get_current_buffer_file_path()),
              '--config',
              vim.fn.stdpath('config') .. '/cbfmt.toml',
            },
            stdin = true,
          }
        end,
      },
      ['markdown.mdx'] = { prettier },
      query = {
        function()
          return {
            exe = 'ts_query_ls',
            args = { 'format' },
          }
        end,
      },
      scss = { prettier },
      sh = { shfmt },
      svg = {
        function()
          prettier('html')
        end,
      },
      toml = { require('formatter.filetypes.toml').taplo },
      typescript = { prettier },
      typescriptreact = { prettier },
      yaml = { prettier },
    },
  })
end

return {
  'mhartington/formatter.nvim',
  config = config,
  cmd = { 'FormatWrite' },
  keys = {
    { '<leader>f', '<cmd>Format<cr>' },
    { '<leader>f', ":'<,'>Format<cr>", mode = 'x' },
    { '<leader>F', '<cmd>FormatWrite<cr>' },
    { '<leader>F', ":'<,'>FormatWrite<cr>", mode = 'x' },
  },
}
