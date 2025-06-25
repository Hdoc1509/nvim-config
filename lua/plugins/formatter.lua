local config = function()
  local prettier = require('formatter.defaults.prettier')

  ---@diagnostic disable-next-line: undefined-field
  require('formatter').setup({
    filetype = {
      astro = { prettier },
      css = { prettier },
      ejs = { prettier },
      groovy = {
        function()
          return {
            exe = 'npm-groovy-lint',
            args = { '--format' },
          }
        end,
      },
      html = { prettier },
      java = { require('formatter.filetypes.java').google_java_format },
      javascript = { prettier },
      javascriptreact = { prettier },
      json = { prettier },
      jsonc = { prettier },
      -- TODO: add kulala-fmt for `http` files
      lua = { require('formatter.filetypes.lua').stylua },
      markdown = { prettier },
      ['markdown.mdx'] = { prettier },
      query = { vim.lsp.buf.format },
      sh = { require('formatter.filetypes.sh').shfmt },
      scss = { prettier },
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
