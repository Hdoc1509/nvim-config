-- table<parser_name, filetype>
local langs_to_register = {
  bash = 'zsh',
  embedded_template = 'ejs',
  -- https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/#supporting-mdx-files
  markdown = 'markdown.mdx',
  gitignore = { 'packwizignore', 'styluaignore' },
}

return {
  setup = function()
    for parser_name, filetype in pairs(langs_to_register) do
      vim.treesitter.language.register(parser_name, filetype)
    end
  end,
}
