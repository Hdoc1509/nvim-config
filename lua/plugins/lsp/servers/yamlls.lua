local schema_store = require('schemastore')

return {
  settings = {
    yaml = {
      schemas = schema_store.yaml.schemas({
        select = { 'GitHub Workflow' },
      }),
    },
  },
}
