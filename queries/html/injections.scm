; extends

(element
  (start_tag
    (attribute
      (quoted_attribute_value
        (attribute_value) @injection.content
        (#lua-match? @injection.content "<%%=")
        (#inject-hygen-ejs! "")))))

(element
  [
    (text) @injection.content
    (start_tag
      (attribute
        (attribute_value) @injection.content))
    (self_closing_tag
      (attribute
        (attribute_value) @injection.content))
  ]
  (#lua-match? @injection.content "^{.*}$")
  (#is-mdx-file? "")
  (#set! injection.language "javascript"))
