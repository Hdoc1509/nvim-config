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

(variable
  [
    "}}"
    "{{"
    "$"
  ] @punctuation.bracket)

(operator) @operator
