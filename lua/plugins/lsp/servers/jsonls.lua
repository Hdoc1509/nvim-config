local schema_store = require('schemastore')

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
      -- TODO: inline require
      schemas = schema_store.json.schemas({ select = selected }),
      validate = { enable = true },
    },
  },
}
