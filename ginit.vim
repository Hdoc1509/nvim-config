""""""""""""""""""""""""""""""
"      Nvim-qt Settings      "
""""""""""""""""""""""""""""""
if exists('g:GuiLoaded')
  GuiFont! FiraCode\ NF:h13:sb
  " Full Screen
  nnoremap <Leader>fs :call GuiWindowFullScreen(1)<CR>
  nnoremap <Leader>Fs :call GuiWindowFullScreen(0)<CR>
endif

""""""""""""""""""""""""""""""
"      Neovide Settings      "
""""""""""""""""""""""""""""""
if exists('g:neovide')
  set guifont=FiraCode\ NF:h12.5

  let g:neovide_cursor_animation_length = 0

  function Toggle_fullscreen()
      if g:neovide_fullscreen == v:true
          let g:neovide_fullscreen=v:false
      else
          let g:neovide_fullscreen=v:true
      endif
  endfunction

  nnoremap <F11> :call Toggle_fullscreen()<CR>
endif

