" Shift+Insert for paste from clipboard in GUI's
inoremap <silent> <S-Insert> <C-r>+
cnoremap <S-Insert> <C-r>+

""""""""""""""""""""""""""""""
"      Nvim-qt Settings      "
""""""""""""""""""""""""""""""
if exists('g:GuiLoaded')
  GuiFont! FiraCode\ NF:h12:sb
  " Full Screen
  nnoremap <leader>fs :call GuiWindowFullScreen(1)<CR>
  nnoremap <leader>Fs :call GuiWindowFullScreen(0)<CR>
endif

""""""""""""""""""""""""""""""
"      Neovide Settings      "
""""""""""""""""""""""""""""""
if exists('g:neovide')
  set guifont=FiraCode\ NF:h12

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

