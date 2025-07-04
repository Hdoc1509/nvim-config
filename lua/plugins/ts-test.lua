return {
  'tree-sitter-grammars/tree-sitter-test',
  build = 'mkdir parser && tree-sitter build -o parser/test.so',
  ft = 'test',
}
