(expression
  (arg
    (context
      (identifier) @function.builtin
      (#any-of? @function.builtin
        "github" "env" "vars" "job" "jobs" "steps" "runner" "secrets" "strategy" "matrix" "needs"
        "inputs"))))

(expression
  (arg
    (context
      (identifier) @function.builtin
      (#any-of? @function.builtin
        "github" "env" "vars" "job" "jobs" "steps" "runner" "secrets" "strategy" "matrix" "needs"
        "inputs"))
    (property
      (property_deref) @punctuation.delimiter)))

(expression
  (arg
    (context
      (identifier) @function.builtin
      (#any-of? @function.builtin
        "github" "env" "vars" "job" "jobs" "steps" "runner" "secrets" "strategy" "matrix" "needs"
        "inputs"))
    (property
      (identifier) @variable.member)))

(variable
  [
    "}}"
    "{{"
    "$"
  ] @punctuation.bracket)

(operator) @operator
