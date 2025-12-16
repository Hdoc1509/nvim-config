return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    'Hdoc1509/hygen.nvim',
  },
  config = function()
    local devicons = require('nvim-web-devicons')
    local by_name = require('nvim-web-devicons.default.icons_by_filename')
    local by_extension = require('nvim-web-devicons.default.icons_by_file_extension')
    local by_os = require('nvim-web-devicons.default.icons_by_operating_system')
    local ICONS = require('icons.files')

    devicons.setup({
      override_by_filename = ICONS.name({
        filename = by_name,
        extension = by_extension,
        os = by_os,
      }),
      override_by_extension = ICONS.extension({
        filename = by_name,
        extension = by_extension,
        os = by_os,
      }),
    })

    require('hygen.web-devicons').setup()
    devicons.set_icon({
      test = {
        icon = by_extension['test.js'].icon,
        color = by_extension.query.color,
        name = 'TSTest',
      },
      minifiles = {
        icon = '󰙅',
        -- from: https://github.com/echasnovski/mini.nvim/blob/main/logo.png
        color = '#B3DAF9',
        name = 'MiniFiles',
      },
      diffview_files = {
        icon = '',
        color = by_extension.git.color,
        name = 'DiffviewFiles',
      },
      -- quickfix icon   (maybe)
    })
    devicons.set_icon_by_filetype({
      cmd = 'cmd',
      fugitive = 'git',
      minifiles = 'minifiles',
      editorconfig = '.editorconfig',
      packwizignore = '.packwizignore',
      minttyrc = '.minttyrc',
      shellcheckrc = '.shellcheckrc',
      styluaignore = '.styluaignore',
      DiffviewFiles = 'diffview_files',
      DiffviewFileHistory = 'diffview_files',
      ts = 'ts' -- for `ts` codeblock in markdown
    })
  end,
  lazy = true,
}
