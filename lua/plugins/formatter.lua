local config = function()
  local prettier = require('formatter.defaults.prettier')
  local utils = require('utils')
  local nmap = utils.nmap
  local keymap = utils.keymap

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

  nmap('<leader>f', '<cmd>Format<cr>')
  nmap('<leader>F', '<cmd>FormatWrite<cr>')
  keymap('x', '<leader>f', ":'<,'>Format<cr>")
  keymap('x', '<leader>F', ":'<,'>FormatWrite<cr>")
end

return {
  'mhartington/formatter.nvim',
  event = 'VeryLazy',
  config = config,
}
