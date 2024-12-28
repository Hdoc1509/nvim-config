local merge = require('utils').merge
local default_settings = require('plugins.lsp.servers._default_settings')

local runtime_exclude = {
  user = vim.fn.expand('~/.config/nvim'),
  user_after = vim.fn.expand('~/.config/nvim/after'),
}

local function on_init(client)
  if client.workspace_folders then
    local path = client.workspace_folders[1].name

    if path ~= runtime_exclude.user then
      return
    end
  end

  local runtime_files = vim.api.nvim_get_runtime_file('', true)

  for k, v in ipairs(runtime_files) do
    if v == runtime_exclude.user_after or v == runtime_exclude.user then
      table.remove(runtime_files, k)
    end
  end

  client.config.settings.Lua = merge(client.config.settings.Lua, {
    runtime = {
      version = 'LuaJIT',
    },
    workspace = {
      checkThirdParty = false,
      library = runtime_files,
    },
  })
end

return merge(default_settings, {
  settings = {
    Lua = {},
  },
  on_init = on_init,
})
