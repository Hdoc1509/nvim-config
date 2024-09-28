return {
  'nvim-tree/nvim-web-devicons',
  opts = {
    override_by_extension = {
      ['astro'] = {
        icon = '',
        color = '#f1502f',
        name = 'Astro',
      },
      ['http'] = {
        icon = '󰖟',
        color = '#228be6',
        name = 'Http',
      },
    },
  },
}
