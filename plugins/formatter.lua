local formatter = require('formatter')
local prettier = require('formatter.defaults').prettier
local filetypes = require('formatter.filetypes')

formatter.setup {
  filetype = {
    lua = { filetypes.lua.stylua },
    css = { prettier('css') },
    html = { prettier('html') },
    javascript = { prettier },
    javascriptreact = { prettier },
    json = { prettier('json') },
    markdown = { prettier('markdown') },
    typescript = { prettier('typescript') },
    typescriptreact = { prettier('typescript') },
    yaml = { prettier('yaml') },
  }
}

