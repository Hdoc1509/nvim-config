; extends

(command_argument) @variable.parameter

(range_statement
  (mark) @punctuation.special)

(range
  (mark) @punctuation.special)

(file) @punctuation.special

(map_statement
  rhs: (map_side
    "\\|" @string.escape))
