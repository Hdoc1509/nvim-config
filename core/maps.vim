" NvimTree
nnoremap <silent> <F1> :NvimTreeFindFileToggle<CR>

" Save file if modified
nnoremap <Leader>w :update<CR>

" Save file if modified and quit
nnoremap <silent> <Leader>q :xit<CR>

" Quit tab
nnoremap <silent> <Leader>tq :tabclose<CR>

" Quit Neovim
nnoremap <Leader>Q :quitall!<CR>

" Scrolling
nnoremap <Leader>j 10<C-e>
nnoremap <Leader>J 20<C-e>
nnoremap <Leader>k 10<C-y>
nnoremap <Leader>K 20<C-y>

" Split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" Add semi colon at the end of line
nnoremap <Leader>; A;<Esc>

" Add comma at the end of line
nnoremap <Leader>, A,<Esc>

" Add a dot at the end of line
nnoremap <Leader>. A.<Esc>

" Edit config file
nnoremap <silent> <Leader>e :e $MYVIMRC<CR>
nnoremap <Leader>ev :vsp $MYVIMRC<CR>

" Run :checkhealth
nnoremap <Leader>chh :checkhealth<CR>

" Splits navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>l <C-w>l

" Git
nnoremap <Leader>gaa :Git add --all<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gl :Git pull<CR>
nnoremap <Leader>gs :Git status<CR>
nnoremap <Leader>gc :Git commit<CR>

" Toogle Word UpperCase
nnoremap <C-u> viw~e
inoremap <C-u> <Esc>viw~ea

" Toogle Word TitleCase
nnoremap <C-t> viwb~e
inoremap <C-t> <Esc>viwb~ea

" Remove Current line
nnoremap <C-d> dd
inoremap <C-d> <Esc>ddi

" Indent and keeps the selection
xnoremap < <gv
xnoremap > >gv

" FZF
nnoremap <silent> <Leader>fzf :FZF<CR>

" TODO-COMMENTS
nnoremap <silent> <Leader>tl :TodoQuickFix<CR>
nnoremap <silent> ]t :lua require('todo-comments').jump_next()<CR>
nnoremap <silent> [t :lua require('todo-comments').jump_prev()<CR>

" VIM-PLUG
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>ps :PlugStatus<CR>
nnoremap <Leader>pud :PlugUpdate<CR>
nnoremap <Leader>pug :PlugUpgrade<CR>

" Open URL under cursor
nnoremap <silent> gx :silent execute '!' . g:browser . ' ' . shellescape(expand('<cfile>'), 1)<CR>

" Clear Searh Highlighting
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Rest Nvim
nnoremap <Leader>rr <Plug>RestNvim<CR>
nnoremap <Leader>rl <Plug>RestNvimLast<CR>

" Vertical help window
cnoremap vh vertical help

lua require('maps')
