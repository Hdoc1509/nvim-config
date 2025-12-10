; extends

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

(element
  (self_closing_tag) @injection.content
  (#lua-match? @injection.content "^<%w+%.%w")
  (#is-mdx-file? "")
  (#set! injection.language "astro")
  (#set! injection.include-children))
