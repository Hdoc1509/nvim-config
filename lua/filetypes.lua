vim.filetype.add({
  extension = {
    ejs = 'ejs',
    -- taken and adapted from https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/#supporting-mdx-files
    mdx = 'markdown.mdx',
    svg = 'html',
  },
})
