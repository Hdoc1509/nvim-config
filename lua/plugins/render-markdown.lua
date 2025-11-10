return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- { dir = '~/dev/nvim-plugins/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', version = '*' },
    { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
  },
  config = function()
    local hygen_utils = require('hygen.utils')
    local allowed_subext = { 'md', 'mdx' }

    local ignore = function(bufnr)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local extension = vim.fn.fnamemodify(filename, ':e')

      if extension == 'hygen' then
        return not vim.tbl_contains(allowed_subext, hygen_utils.get_hygen_subext(filename))
      else
        return false
      end
    end

    require('render-markdown').setup({
      heading = {
        icons = { '◉ ', '○ ', '✸ ', '✿ ' },
        sign = false,
      },
      pipe_table = {
        cell = 'trimmed',
      },
      code = {
        sign = false,
        border = 'thick',
        highlight_inline = 'None',
      },
      html = {
        comment = { conceal = false },
      },
      ignore = ignore,
    })
  end,
  ft = { 'markdown', 'markdown.mdx', 'hygen', 'gitcommit' },
}
