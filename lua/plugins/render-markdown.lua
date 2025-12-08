return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- { dir = '~/dev/nvim-plugins/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', version = '^0.4.2' },
    -- { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
  },
  config = function()
    local hygen_utils = require('hygen.utils')
    local allowed_subext = { 'md', 'mdx' }

    local ignore = function(bufnr)
      if vim.bo[bufnr].filetype == 'hygen' then
        return not vim.tbl_contains(allowed_subext, hygen_utils.get_hygen_subext(bufnr))
      else
        return false
      end
    end

    require('render-markdown').setup({
      heading = {
        sign = false,
      },
      pipe_table = {
        cell = 'trimmed',
        border_enabled = false,
      },
      code = {
        sign = false,
        border = 'thick',
        highlight_inline = 'None',
        width = 'block',
        right_pad = 1,
      },
      html = {
        comment = { conceal = false },
      },
      ignore = ignore,
      link = {
        custom = {
          firefox_addons = { pattern = 'addons%.mozilla%.org', icon = '󰈹 ' },
          png = { pattern = '%.png$', icon = '󰥶 ' },
          gif = { pattern = '%.gif$', icon = '󰕧 ' },
          markdown = { pattern = '%.md$', icon = ' ' },
          vimhelp = { pattern = 'vimhelp%.org', icon = '' },
        },
      },
    })
  end,
  ft = { 'markdown', 'markdown.mdx', 'hygen', 'gitcommit', 'yaml' },
  version = '^8.10.0',
}
