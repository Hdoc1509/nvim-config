; extends

; taken from https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/#extending-treesitter-injection-queries
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#inject-mdx-js! ""))
((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#inject-mdx-js! "")
  (#set! injection.include-children))

; syntax highlighting for tsx comments
((inline) @injection.content
  (#lua-match? @injection.content "^%s*{/*")
  (#inject-mdx-js! ""))
