; extends

(predicate
  type: (predicate_type) @_pred_type
  parameters: (parameters
    .
    (capture) @_capture
    (string
      (string_content) @function))
  (#eq? @_pred_type "?")
  (#eq? @_capture "@_fn")
  (#not-lua-match? @function "%.")
  (#set! injection.language "lua")
  (#is-nvim-config-file? "queries/lua/highlights.scm"))

(predicate
  type: (predicate_type) @_pred_type
  parameters: (parameters
    .
    (capture) @_capture
    (string
      (string_content) @function))
  (#eq? @_pred_type "?")
  (#any-of? @_capture "@function" "@_fn" "@_vimcmd_identifier")
  (#not-lua-match? @function "%.")
  (#set! injection.language "lua")
  (#is-nvim-config-file? "queries/lua/injections.scm"))
