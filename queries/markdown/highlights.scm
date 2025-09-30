; extends

; taken from https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/#disabling-spell-checking
((inline) @_inline (#lua-match? @_inline "^%s*import")) @nospell
((inline) @_inline (#lua-match? @_inline "^%s*export")) @nospell
