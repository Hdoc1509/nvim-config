return {
  {
    'kiran94/edit-markdown-table.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'folke/snacks.nvim' },
    cmd = 'EditMarkdownTable',
  },
  {
    'SCJangra/table-nvim',
    ft = 'markdown',
    opts = {
      mappings = {
        insert_row_up = '<C-A-k>',
        insert_row_down = '<C-A-j>',
        insert_column_left = '<C-A-h>',
        insert_column_right = '<C-A-l>',
      },
    },
  },
}
