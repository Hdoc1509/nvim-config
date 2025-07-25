local schema_store = require('schemastore')
local merge = require('utils').merge
local default_settings = require('plugins.lsp.servers._default_settings')

local selected = {
  '.eslintrc',
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  'fabric.mod.json',
}

return merge(default_settings, {
  settings = {
    json = {
      schemas = schema_store.json.schemas({ select = selected }),
      validate = { enable = true },
    },
  },
})
