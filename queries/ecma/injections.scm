; extends

; === CSS injections ===
(call_expression
  [
    (member_expression
      (property_identifier) @method
      (#any-of? @method "matches" "querySelector" "querySelectorAll" "closest"))
    ; custom functions that I use
    ((identifier) @function.name
      (#any-of? @function.name "getElementBySelector" "getAllElementsBySelector"))
  ]
  (arguments
    [
      (string
        (string_fragment) @injection.content)
      (template_string
        (string_fragment) @injection.content)
    ])
  (#set! injection.language "css"))

; === Triple slash comment ===
(((comment) @_triple_slash
  (#lua-match? @_triple_slash "^///")) @injection.content
  (#set! injection.language "html"))
