; extends

; utils
(function_call
  (identifier) @function
  (#eq? @function "autocmd")
  (arguments
    (table_constructor
      (field
        (identifier) @field
        (#eq? @field "pattern")
        value: [
          (string
            (string_content) @string.special)
          (table_constructor
            (field
              (string
                (string_content) @string.special)))
        ]))))
