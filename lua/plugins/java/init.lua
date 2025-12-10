local function config()
  local jdtls = require('jdtls')
  local java_bin_path = require('plugins.java.java-bin')
  local data_dir = require('plugins.java.data-dir')
  local options = require('plugins.java.static-options')

  local cache = { java_bin = nil, root_dir = nil, workspace_data_dir = nil }

  require('utils').autocmd('FileType', {
    pattern = 'java',
    callback = function()
      if cache.root_dir == nil then
        cache.root_dir = vim.fs.root(0, options.root_markers)
      end
      if cache.root_dir == nil then
        return
      end

      if cache.java_bin == nil then
        cache.java_bin = java_bin_path.get_java_bin(cache.root_dir)
      end

      if cache.workspace_data_dir == nil then
        cache.workspace_data_dir = data_dir.get_data_dir(cache.root_dir)
      end

      jdtls.start_or_attach({
        cmd = {
          cache.java_bin,

          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xmx1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens',
          'java.base/java.util=ALL-UNNAMED',
          '--add-opens',
          'java.base/java.lang=ALL-UNNAMED',

          '-jar',
          options.equinox_launcher_jar,

          '-configuration',
          options.config_path,

          '-data',
          cache.workspace_data_dir,
        },
        root_dir = cache.root_dir,
        handlers = options.lsp_start.handlers,
        capabilities = options.lsp_start.capabilities,
        settings = options.lsp_start.settings,
      })
    end,
  })
end

return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  dependencies = {
    'williamboman/mason.nvim',
    'itchyny/vim-gitbranch',
  },
  config = config,
}
