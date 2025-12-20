local selected = {
  'GitHub Workflow',
  'GitHub Issue Template forms',
}

return {
  settings = {
    yaml = {
      schemas = require('schemastore').yaml.schemas({ select = selected }),
    },
  },
}
