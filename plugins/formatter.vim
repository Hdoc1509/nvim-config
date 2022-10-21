lua << EOF
local formatter = require('formatter')
local prettier_formatter = function(filetype)
  return require('formatter.filetypes.'.. filetype).prettier
end

require('formatter').setup {
  filetype = {
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    css = { prettier_formatter('css') },
    html = { prettier_formatter('html') },
    javascript = { prettier_formatter('javascript') },
    javascriptreact = { prettier_formatter('javascriptreact') },
    json = { prettier_formatter('json') },
    markdown = { prettier_formatter('markdown') },
    typescript = { prettier_formatter('typescript') },
    typescriptreact = { prettier_formatter('typescriptreact') },
  }
}
EOF
