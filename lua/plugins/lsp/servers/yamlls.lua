local schema_store = require('schemastore')
local merge = require('utils').merge
local default_settings = require('plugins.lsp.servers._default_settings')

return merge(default_settings, {
  settings = {
    yaml = {
      schemas = schema_store.yaml.schemas({
        select = { 'GitHub Workflow' },
      }),
    },
  },
})
