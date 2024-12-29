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
    local merge = require('utils').merge
    local capabilities = require('plugins.lsp.capabilities')
    local default_handlers = require('plugins.lsp.handlers')
    local system = 'linux'

    local handlers = merge(default_handlers, {
      -- remove status from statusline
      ['language/status'] = function() end,
    })

    if vim.fn.has('mac') == 1 then
      system = 'mac'
    elseif vim.fn.has('win32') == 1 then
      system = 'win'
    end

    local java_bin_cache = nil
    local default_java_version = '21'
    local jdtls_path = mason.get_package('jdtls'):get_install_path()
    local equinox_launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
    local cache_dir = vim.fn.expand('~/.cache/jdtls/workspace')
    local root_markers = { '.git', 'mvnw', 'gradlew' }
    -- NOTE: is this needed if we retrieve the java version from gradle.properties?
    -- I'm only using java for gradle projects .-.
    local java_runtimes = vim.fn.map({ '17', '21' }, function(_, version)
      return {
        name = 'JavaSE-' .. version,
        path = vim.fn.expand('~/.sdkman/candidates/java/' .. version .. '.*-tem'),
      }
    end)
    local config_path = jdtls_path .. '/config_' .. system

    ---@param workspace_path string
    ---@return string[] | nil
    local function get_gradle_properties(workspace_path)
      return vim.fn.filereadable(workspace_path .. '/gradle.properties') == 1
          and vim.fn.readfile(workspace_path .. '/gradle.properties', '', 20)
        or nil
    end

    local function filter_java_version_line(_, line)
      local _, _, _version = string.find(line, 'java_version=(%d+)')
      return _version ~= nil
    end

    local function get_java_version_from_line(_, line)
      return string.match(line, '%d+') --[[@as string]]
    end

    require('utils').autocmd('FileType', {
      pattern = 'java',
      callback = function()
        local root_dir = jdtls_setup.find_root(root_markers)
        local workspace_name = vim.fn.fnamemodify(root_dir, ':p:h:t')

        if java_bin_cache == nil then
          local java_version = ''
          local gradle_properties = get_gradle_properties(root_dir)

          if gradle_properties ~= nil then
            java_version = vim.fn.map(
              vim.fn.filter(vim.fn.copy(gradle_properties), filter_java_version_line),
              get_java_version_from_line
            )[1] or default_java_version
          else
            java_version = default_java_version
          end

          java_bin_cache = vim.fn.expand('~/.sdkman/candidates/java/' .. java_version .. '.*-tem/bin/java')
        end

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
            java_bin_cache,

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
                runtimes = java_runtimes,
              },
            },
          },
        })
      end,
    })
  end,
}
