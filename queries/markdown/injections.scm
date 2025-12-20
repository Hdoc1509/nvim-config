; extends

; taken from https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/#extending-treesitter-injection-queries
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#is-mdx-file? "")
  (#set! injection.language "javascript"))
((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#is-mdx-file? "")
  (#set! injection.language "javascript"))

; syntax highlighting for tsx comments
((inline) @injection.content
  (#lua-match? @injection.content "^%s*{/*")
  (#is-mdx-file? "")
  (#set! injection.language "javascript"))
