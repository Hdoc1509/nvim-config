local selected = {
  '.eslintrc',
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  'fabric.mod.json',
}

return {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas({ select = selected }),
      validate = { enable = true },
    },
  },
}
