; extends

(predicate
  type: (predicate_type) @_pred_type
  parameters: (parameters
    .
    (capture) @_capture
    (string
      (string_content) @injection.content))
  (#eq? @_pred_type "?")
  (#eq? @_capture "@_fn")
  (#lua-match? @injection.content "%.")
  (#set! injection.language "lua")
  (#is-nvim-config-file? "queries/lua/highlights.scm"))

(predicate
  type: (predicate_type) @_pred_type
  parameters: (parameters
    .
    (capture) @_capture
    (string
      (string_content) @injection.content))
  (#eq? @_pred_type "?")
  (#any-of? @_capture "@function" "@_fn" "@_vimcmd_identifier")
  (#lua-match? @injection.content "%.")
  (#set! injection.language "lua")
  (#is-nvim-config-file? "queries/lua/injections.scm"))
