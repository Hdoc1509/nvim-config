let mapleader=" "

" NERDTree
nmap <Leader>nt :NERDTreeFind<CR>

" File handling
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Scrolling
nmap <Leader>j 10<C-e>
nmap <Leader>k 10<C-y>

" Split resize
nmap <Leader>> 10<C-w>>
nmap <Leader>< 10<C-w><

" Add semi colon
nmap <Leader>; $a;<Esc>

" Edit config file
nmap <Leader>e :e $MYVIMRC<CR>
nmap <Leader>ev :vsp $MYVIMRC<CR>
nmap <Leader>sf :source %<CR>
nmap <Leader>sv :source $MYVIMRC<CR>

" Git
nmap <Leader>gaa :Git add .<CR>
nmap <Leader>gd :Git diff<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gl :Git pull<CR>
nmap <Leader>gs :Git status<CR>

