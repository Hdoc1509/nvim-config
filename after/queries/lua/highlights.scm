; extends

(function_call
  (identifier) @function
  (#eq? @function "autocmd")
  (arguments
    (table_constructor
      (field
        (identifier) @field
        (#eq? @field "pattern")
        (string
          (string_content) @string.special)))))
