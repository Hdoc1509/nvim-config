return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ---@type render.md.UserConfig
  opts = {
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
      above = '',
      language_border = '',
    },
    ignore = function(bufnr)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local extension = vim.fn.fnamemodify(filename, ':e')

      if extension == 'hygen' then
        local _, _, subextension = string.find(filename, '.*%.(%a+)(%.%a+)')

        return subextension ~= 'md'
      else
        return false
      end
    end,
    html = {
      comment = { conceal = false },
    },
  },
  ft = { 'markdown', 'markdown.mdx', 'hygen', 'gitcommit' },
}
