let mapleader=" "

" NERDTree
nmap <Leader>nt :NERDTreeFind<CR>

" Custom
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>fs :call GuiWindowFullScreen(1)<CR>
nmap <Leader>Fs :call GuiWindowFullScreen(0)<CR>
nmap <Leader>j 10<C-e>
nmap <Leader>k 10<C-y>
nmap <Leader>; $a;<Esc>
nmap <Leader>E :e .config/init.vim<CR>

" Git
nmap <Leader>gaa :Git add .<CR>
nmap <Leader>gd :Git diff<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gl :Git pull<CR>
nmap <Leader>gs :Git status<CR>

