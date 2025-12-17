local schema_store = require('schemastore')

local selected = {
  'GitHub Workflow',
  'GitHub Issue Template forms',
}

return {
  settings = {
    yaml = {
      -- TODO: inline require
      schemas = schema_store.yaml.schemas({ select = selected }),
    },
  },
}
