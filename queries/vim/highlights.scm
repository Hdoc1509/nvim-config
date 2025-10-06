; extends

(command_argument) @variable.parameter

(range_statement
  (mark) @punctuation.special)

(file) @punctuation.special

(ERROR
  ((range_statement) @punctuation.special
    (keyword) @keyword)
  (#eq? @punctuation.special ".")
  (#eq? @keyword "lua")
  (#is-lazy-config-file? ""))
