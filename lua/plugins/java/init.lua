return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  dependencies = {
    'williamboman/mason.nvim',
    'tpope/vim-fugitive',
  },
  config = function()
    local mason = require('mason-registry')
    local jdtls = require('jdtls')
    local jdtls_setup = require('jdtls.setup')
    local capabilities = require('plugins.lsp.capabilities')
    local handlers = require('plugins.java.handlers')
    local runtimes = require('plugins.java.runtimes')
    local jdk_version = require('plugins.java.jdk-version')
    local system = 'linux'

    if vim.fn.has('mac') == 1 then
      system = 'mac'
    elseif vim.fn.has('win32') == 1 then
      system = 'win'
    end

    local java_bin = nil
    local root_dir = nil
    local workspace_data_dir = nil
    local default_java_version = '21'
    local jdtls_path = mason.get_package('jdtls'):get_install_path()
    local equinox_launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
    local cache_dir = vim.fn.expand('~/.cache/jdtls/workspace')
    local root_markers = { '.git', 'mvnw', 'gradlew' }
    local config_path = jdtls_path .. '/config_' .. system

    require('utils').autocmd('FileType', {
      pattern = 'java',
      callback = function()
        if root_dir == nil then
          root_dir = jdtls_setup.find_root(root_markers)
        end

        if java_bin == nil then
          local java_sdkman = jdk_version.get_from_sdkmanrc(root_dir)

          if java_sdkman == nil then
            local java_version = jdk_version.get_from_gradle_properties(root_dir) or default_java_version

            java_bin = vim.fn.expand('~/.sdkman/candidates/java/' .. java_version .. '.*-tem/bin/java')
          else
            java_bin = vim.fn.expand('~/.sdkman/candidates/java/' .. java_sdkman .. '/bin/java')
          end
        end

        if workspace_data_dir == nil then
          local workspace_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
          -- useful if branches have different configs
          -- NOTE: clean eclipse and gradle generated files every time you switch branch
          -- reference: https://github.com/Hdoc1509/hotbar-keys/tree/1.21.3/scripts/clean.sh
          local branchesResult = vim.fn.FugitiveExecute('branch')

          if branchesResult.exit_status == 0 then
            local current_branch = vim.fn.FugitiveHead()
            workspace_name = workspace_name .. '_branch-' .. current_branch
          end

          workspace_data_dir = cache_dir .. '/' .. workspace_name
        end

        jdtls.start_or_attach({
          cmd = {
            java_bin,

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
            equinox_launcher_jar,

            '-configuration',
            config_path,

            '-data',
            workspace_data_dir,
          },
          root_dir = root_dir,
          handlers = handlers,
          capabilities = capabilities,
          settings = {
            java = {
              configuration = {
                runtimes = runtimes,
              },
            },
          },
        })
      end,
    })
  end,
}
