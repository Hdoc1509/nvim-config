let g:mapleader="\<Space>"

" NvimTree
nnoremap <silent> <F1> :NvimTreeFindFileToggle<CR>

" Save buffer
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wa :wa<CR>

" Quit buffer
nnoremap <silent> <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" Quit Neovim
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>Qa :qa!<CR>

" Set fileformat
nnoremap <Leader>fu :set ff=unix<CR>
nnoremap <Leader>fd :set ff=dos<CR>
nnoremap <Leader>fm :set ff=mac<CR>

" Scrolling
nnoremap <Leader>j 10<C-e>
nnoremap <Leader>J 20<C-e>
inoremap <C-Down> <Esc>10<C-e>a
nnoremap <Leader>k 10<C-y>
nnoremap <Leader>K 20<C-y>
inoremap <C-Up> <Esc>10<C-y>a

" Split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" Add semi colon at the end of line
nnoremap <Leader>; A;<Esc>

" Add comma at the end of line
nnoremap <Leader>, A,<Esc>

" Add a dot at the end of line
nnoremap <Leader>. A.<Esc>

" Replace tabs to spaces
nnoremap <Leader>rts :retab<CR>

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

" FZF
nnoremap <silent> <Leader>fzf :FZF --reverse<CR>

" TODO-COMMENTS
nnoremap <silent> <Leader>tl :TodoQuickFix<CR>

" VIM-PLUG
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>ps :PlugStatus<CR>

" Open URL under cursor
nnoremap <silent> <Leader>ou :silent execute '!' . g:browser . ' ' . shellescape(expand('<cfile>'), 1)<CR>

lua require('maps')
