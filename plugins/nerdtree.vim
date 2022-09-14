let NERDTreeIgnore = ["\.git$", "node_modules"]
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeSortHiddenFirst = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ "Modified"  : "M",
  \ "Staged"    : "➜",
  \ "Untracked" : "U",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ "Unknown"   : "?"
  \ }

"get rid of [  ] around icons in NerdTree
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

