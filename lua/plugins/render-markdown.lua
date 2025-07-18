return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', version = '*' },
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
        width = 'block',
        min_width = 79,
        -- FIX: breaks custom icons. works from nvim-0.10
        -- position = 'inline',
      },
      pipe_table = {
        -- TODO: use 'trimmed' once updated to nvim-0.10
        cell = 'overlay',
      },
      code = {
        sign = false,
        width = 'block',
        below = '',
        language_border = '',
      },
      html = {
        comment = { conceal = false },
      },
      ignore = ignore,
    })
  end,
  ft = { 'markdown', 'markdown.mdx', 'hygen', 'gitcommit' },
}
