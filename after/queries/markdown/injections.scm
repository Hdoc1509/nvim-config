; extends

; taken from https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/#extending-treesitter-injection-queries
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "typescript"))
((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "typescript"))

; syntax highlighting for tsx comments
((inline) @injection.content
  (#lua-match? @injection.content "^%s*{/*")
  (#set! injection.language "tsx"))


; TODO: Enable again if it's really necessary
; syntax highlighting for tsx components
; ((html_block) @injection.content
;   (#set! injection.language "tsx"))
