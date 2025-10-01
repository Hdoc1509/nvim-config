local lspconfig = require('lspconfig')

local hooks = {
  before = {
    unpack(require('plugins.lsp.servers.gh_actions_ls.hooks').before),
  },
}

local function setup()
  for _, hook in ipairs(hooks.before) do
    lspconfig.util.on_setup = lspconfig.util.add_hook_before(lspconfig.util.on_setup, hook)
  end
end

return { setup = setup }
