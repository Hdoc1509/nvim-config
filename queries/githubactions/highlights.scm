; NOTE: should I use
; (#any-of? @function.builtin "github" "secrets")
(expression
  (arg
    (context
      (identifier) @function.builtin)))

(expression
  (arg
    (property
      (property_deref) @punctuation.delimiter)))

(expression
  (arg
    (property
      (identifier) @variable.member)))

(variable
  [
    "}}"
    "{{"
    "$"
  ] @punctuation.bracket)

(operator) @operator

; TODO: add "." (dot) to tree-sitter-github-actions fork
; "." @punctuation.delimiter
