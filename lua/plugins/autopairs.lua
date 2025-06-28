return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local Rule = require('nvim-autopairs.rule')
    local npairs = require('nvim-autopairs')

    npairs.setup({})

    npairs.add_rules({
      Rule('<% ', ' %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
      Rule('<%=', '  %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
      Rule('<%-', '  %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
      Rule('<%#', '  %>', { 'ejs', 'hygen' }):set_end_pair_length(3),
      Rule('<!--', ' -->', { 'html', 'ejs' }),
      Rule('{/*', '  */', { 'markdown.mdx' }):set_end_pair_length(3),
    })
  end,
}
