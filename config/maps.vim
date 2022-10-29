let mapleader=" "

" NERDTree
nnoremap <silent> <Leader>nt :NERDTreeFind<CR>
nnoremap <silent> <Leader>ntrr :NERDTreeRefreshRoot<CR>

" Save buffer
nnoremap <Leader>w :w<CR>

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
nnoremap <Leader>k 10<C-y>
nnoremap <Leader>K 20<C-y>

" Split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" Add semi colon
nnoremap <Leader>; A;<Esc>

" Add comma
nnoremap <Leader>, A,<Esc>

" Replace tabs to spaces
nnoremap <Leader>rts :retab<CR>

" Edit config file
nnoremap <Leader>e :e $MYVIMRC<CR>
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

" Word UpperCase
nnoremap <C-u> viwUe
inoremap <C-u> <Esc>viwUea

" Word TitleCase
nnoremap <C-t> b~le
inoremap <C-t> <Esc>b~lea

" Remove Current line
nnoremap <C-d> dd
inoremap <C-d> <Esc>ddi

" FZF
nnoremap <silent> <Leader>fzf :FZF --reverse<CR>

so ~/.config/nvim/config/maps_lua.lua
