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
  (#inject-mdx-js! ""))

(element
  (self_closing_tag) @injection.content
  (#lua-match? @injection.content "^<%w+%.%w")
  (#is-mdx-file? "")
  (#set! injection.language "astro")
  (#set! injection.include-children))
