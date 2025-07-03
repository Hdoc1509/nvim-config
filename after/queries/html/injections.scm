; extends

(element
  (start_tag
    (attribute
      (quoted_attribute_value
        (attribute_value) @injection.content
        (#lua-match? @injection.content "<%%=")
        (#inject-hygen-ejs!)))))
