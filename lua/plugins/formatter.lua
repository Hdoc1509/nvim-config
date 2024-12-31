local config = function()
  local prettier = require('formatter.defaults.prettier')
  local nmap = require('utils').nmap

  ---@diagnostic disable-next-line: undefined-field
  require('formatter').setup({
    filetype = {
      astro = { prettier },
      css = { prettier('css') },
      groovy = {
        function()
          return {
            exe = 'npm-groovy-lint',
            args = { '--format' },
          }
        end,
      },
      html = { prettier('html') },
      java = { require('formatter.filetypes.java').google_java_format },
      javascript = { prettier },
      javascriptreact = { prettier },
      json = { prettier('json') },
      jsonc = { prettier },
      lua = { require('formatter.filetypes.lua').stylua },
      markdown = { prettier('markdown') },
      ['markdown.mdx'] = { prettier('mdx') },
      query = { vim.lsp.buf.format },
      sh = { require('formatter.filetypes.sh').shfmt },
      scss = { prettier('scss') },
      typescript = { prettier('typescript') },
      typescriptreact = { prettier('typescript') },
      yaml = { prettier('yaml') },
    },
  })

  nmap('<leader>f', '<cmd>Format<cr>')
  nmap('<leader>F', '<cmd>FormatWrite<cr>')
end

return {
  'mhartington/formatter.nvim',
  event = 'VeryLazy',
  config = config,
}
