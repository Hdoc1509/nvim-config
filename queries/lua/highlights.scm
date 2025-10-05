; extends

; TODO: add the same highlight to events lists in lint/init.lua
; TODO: add the same highlight to events in dependencies
(chunk
  (return_statement
    (expression_list
      (table_constructor
        (field
          name: (identifier) @_field
          value: [
            (string
              content: (string_content) @constant)
            (table_constructor
              (field
                value: (string
                  content: (string_content) @constant)))
          ]))))
  (#is-lazy-config-file? "")
  (#eq? @_field "event"))
