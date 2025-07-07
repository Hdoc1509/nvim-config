local jdtls_path = vim.fn.expand('$MASON/packages/jdtls')
local system = 'linux'

if vim.fn.has('mac') == 1 then
  system = 'mac'
elseif vim.fn.has('win32') == 1 then
  system = 'win'
end

return {
  equinox_launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
  config_path = jdtls_path .. '/config_' .. system,
  root_markers = { '.git', 'mvnw', 'gradlew' },
  -- vim.lsp.start_client
  lsp_start = {
    handlers = require('plugins.java.handlers'),
    capabilities = require('plugins.lsp.capabilities'),
    settings = {
      java = {
        configuration = { runtimes = require('plugins.java.runtimes') },
      },
    },
  },
}
