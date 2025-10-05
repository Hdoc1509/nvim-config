local config = function()
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
      -- TODO: enable once `rest.nvim` has been replaced by `kulala.nvim`
      --[[ http = {
        function()
          return {
            exe = 'kulala-fmt',
            args = { 'format' },
          }
        end,
      }, ]]
      java = { require('formatter.filetypes.java').google_java_format },
      javascript = { prettier },
      javascriptreact = { prettier },
      json = { prettier },
      jsonc = { prettier },
      lua = { require('formatter.filetypes.lua').stylua },
      markdown = { prettier },
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
      typescript = { prettier },
      typescriptreact = { prettier },
      yaml = { prettier },
    },
  })
end

return {
  'mhartington/formatter.nvim',
  config = config,
  keys = {
    { '<leader>f', '<cmd>Format<cr>' },
    { '<leader>f', ":'<,'>Format<cr>", mode = 'x' },
    { '<leader>F', '<cmd>FormatWrite<cr>' },
    { '<leader>F', ":'<,'>FormatWrite<cr>", mode = 'x' },
  },
}
