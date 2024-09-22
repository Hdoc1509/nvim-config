local ext_to_parser = {
  ['ts'] = 'typescript',
  ['js'] = 'javascript',
  ['jsx'] = 'javascriptreact',
  ['md'] = 'markdown',
  ['svg'] = 'html',
}

local directives = {
  -- https://github.com/nvim-treesitter/nvim-treesitter/discussions/1917#discussioncomment-10714144
  ['inject-ejs-tmpl!'] = function(_, _, bufnr, _, metadata)
    local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
    -- files ending in .{ext}.ejs
    local _, _, ext, _ = string.find(fname, '.*%.(%a+)(%.%a+)')

    metadata['injection.language'] = ext_to_parser[ext] or ext
  end,
}

local config = function()
  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'astro',
      -- 'c',
      -- 'cpp',
      'bash',
      'css',
      'embedded_template',
      'gitignore',
      'html',
      'http',
      'javascript',
      'jsdoc',
      'json',
      'jsonc',
      'lua',
      'markdown',
      'markdown_inline',
      'scss',
      'typescript',
      'tsx',
      'vim',
      'vimdoc',
      'yaml',
    },
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true }, -- nvim-ts-autotag
  })

  -- REGISTER LANGUAGES
  vim.treesitter.language.register('embedded_template', 'ejs')
  -- taken and adapted from https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/#supporting-mdx-files
  vim.treesitter.language.register('markdown', 'markdown.mdx')

  -- DIRECTIVES
  for directive, callback in pairs(directives) do
    vim.treesitter.query.add_directive(directive, callback, {})
  end
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        require('ts_context_commentstring').setup({
          enable_autocmd = false,
        })
      end,
    },
    'windwp/nvim-ts-autotag',
  },
  config = config,
  event = { 'BufReadPre', 'BufNewFile' },
}
