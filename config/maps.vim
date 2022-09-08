let mapleader=" "

" NERDTree
nmap <Leader>nt :NERDTreeFind<CR>

" File handling
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Full Screen
nmap <Leader>fs :call GuiWindowFullScreen(1)<CR>
nmap <Leader>Fs :call GuiWindowFullScreen(0)<CR>

" Scrolling
nmap <Leader>j 10<C-e>
nmap <Leader>k 10<C-y>

" Add semi colon
nmap <Leader>; $a;<Esc>

" Edit config file
nmap <Leader>E :e $MYVIMRC<CR>
nmap <Leader>src :source<CR>

" Git
nmap <Leader>gaa :Git add .<CR>
nmap <Leader>gd :Git diff<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gl :Git pull<CR>
nmap <Leader>gs :Git status<CR>

