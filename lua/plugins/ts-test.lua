return {
  'tree-sitter-grammars/tree-sitter-test',
  build = 'mkdir --parents parser && tree-sitter build --output parser/test.so',
  ft = 'test',
  version = '^0.3.0',
}
