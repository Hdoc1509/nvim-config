local function setup()
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

  -- TODO: follow updates of
  -- https://github.com/nvim-treesitter/nvim-treesitter/tree/main/runtime/queries/zsh

  ---@type ParserInfo
  ---@diagnostic disable-next-line: inject-field
  parser_config.zsh = {
    install_info = {
      revision = 'v0.42.0',
      url = 'https://github.com/georgeharker/tree-sitter-zsh',
      files = { 'src/parser.c', 'src/scanner.c' },
      requires_generate_from_grammar = true,
    },
    maintainers = { '@georgeharker' },
    filetype = 'zsh',
  }
end

return { setup = setup }
