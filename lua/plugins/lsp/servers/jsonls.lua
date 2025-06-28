local schema_store = require('schemastore')
local merge = require('utils').merge
local default_settings = require('plugins.lsp.servers._default_settings')

local selected = {
  '.eslintrc',
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  'luarc',
  'fabric.mod.json',
}

-- TODO: check if this is needed after install of `folke/neodev.nvim`
local extra = {
  {
    description = 'JSON schema for .luarc.json',
    fileMatch = { '.luarc.json', '.luarc.jsonc' },
    name = 'luarc',
    url = 'https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json',
  },
}

return merge(default_settings, {
  settings = {
    json = {
      schemas = schema_store.json.schemas({
        select = selected,
        extra = extra,
      }),
      validate = { enable = true },
    },
  },
})
