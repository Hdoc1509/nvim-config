(expression
  (arg
    (context
      (identifier) @function.builtin
      (#any-of? @function.builtin
        "github" "env" "vars" "job" "jobs" "steps" "runner" "secrets" "strategy" "matrix" "needs"
        "inputs"))
    (property
      (property_deref) @punctuation.delimiter
      (identifier) @variable.member)))

(expression
  (arg
    (call
      (identifier) @function)))
(expression
  (arg
    (call
      [
        "("
        ")"
      ] @punctuation.bracket)))

(variable
  [
    "}}"
    "{{"
    "$"
  ] @punctuation.bracket)

[
  (operator)
  (not)
] @operator
