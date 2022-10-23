""""""""""""""""""""""""""""""
"      Nvim-qt Settings      "
""""""""""""""""""""""""""""""
if exists('g:GuiLoaded')
  " Full Screen
  nmap <Leader>fs :call GuiWindowFullScreen(1)<CR>
  nmap <Leader>Fs :call GuiWindowFullScreen(0)<CR>
endif

""""""""""""""""""""""""""""""
"      Neovide Settings      "
""""""""""""""""""""""""""""""
if exists('g:neovide')
  let g:neovide_cursor_animation_length = 0

  nmap <Leader>fs :let g:neovide_fullscreen=v:true<CR>
  nmap <Leader>Fs :let g:neovide_fullscreen=v:false<CR>
endif

