local lsp_util = require('lspconfig').util

local hooks = {
  before = {
    unpack(require('plugins.lsp.servers.gh_actions_ls.hooks').before),
  },
}

local function setup()
  for _, hook in ipairs(hooks.before) do
    lsp_util.on_setup = lsp_util.add_hook_before(lsp_util.on_setup, hook)
  end
end

return { setup = setup }
