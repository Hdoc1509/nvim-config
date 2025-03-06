; extends

; === CSS injections ===
; Element.matches()
(call_expression
  (member_expression
    (property_identifier) @method
    (#any-of? @method "matches" "querySelector" "querySelectorAll"))
  (arguments
    [
      (string
        (string_fragment) @injection.content)
      (template_string
        (string_fragment) @injection.content)
    ]
    (#set! injection.language "css")))

; custom functions that I use
(call_expression
  ((identifier) @function.name
    (#any-of? @function.name "getElementBySelector" "getAllElementsBySelector"))
  (arguments
    [
      (string
        (string_fragment) @injection.content)
      (template_string
        (string_fragment) @injection.content)
    ]
    (#set! injection.language "css")))
