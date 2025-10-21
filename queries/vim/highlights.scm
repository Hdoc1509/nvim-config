; extends

(command_argument) @variable.parameter

(range_statement
  [
    (mark)
    (current_line)
  ] @punctuation.special)

(range
  (mark) @punctuation.special)

(file) @punctuation.special

(map_statement
  rhs: (map_side
    "\\|" @string.escape))
