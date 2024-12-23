return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  dependencies = {
    'williamboman/mason.nvim',
    'tpope/vim-fugitive',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local mason = require('mason-registry')
    local jdtls = require('jdtls')
    local jdtls_setup = require('jdtls.setup')
    local capabilities = require('plugins.lsp.capabilities')
    local handlers = require('plugins.lsp.handlers')
    local system = 'linux'

    -- remove status from statusline
    handlers['language/status'] = function() end

    if vim.fn.has('mac') == 1 then
      system = 'mac'
    elseif vim.fn.has('win32') == 1 then
      system = 'win'
    end

    local jdtls_path = mason.get_package('jdtls'):get_install_path()
    local java_bin = vim.fn.expand('~/.sdkman/candidates/java/17.*-tem/bin/java')
    local equinox_launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
    local cache_dir = vim.fn.expand('~/.cache/jdtls/workspace')
    local root_markers = { '.git', 'mvnw', 'gradlew' }
    local config_path = jdtls_path .. '/config_' .. system

    require('utils').autocmd('FileType', {
      pattern = 'java',
      callback = function()
        local workspace_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
        -- FIX: when using git branch approach to set workspace name, LSP
        -- crashes on startup.
        -- NOTE: this can be useful if branches have different configs
        --
        -- local branchesResult = vim.fn.FugitiveExecute('branch')
        --
        -- if branchesResult.exit_status == 0 then
        --   local current_branch = vim.fn.FugitiveHead()
        --   workspace_name = workspace_name .. '_branch-' .. current_branch
        -- end

        local workspace_data_dir = cache_dir .. '/' .. workspace_name

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
          root_dir = jdtls_setup.find_root(root_markers),
          handlers = handlers,
          capabilities = capabilities,
        })
      end,
    })
  end,
}
