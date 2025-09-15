; extends

; === Triple slash comment in ECMA files ===
((text) @_triple_slash
  (#eq? @_triple_slash "///")
  .
  (element
    (self_closing_tag
      (tag_name) @_tag
      (#eq? @_tag "reference")
      .
      (attribute
        (attribute_name) @_attr
        (#eq? @_attr "types")
        .
        (quoted_attribute_value) @string))))
