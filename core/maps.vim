" Save file if modified
nnoremap <silent> <Leader>w :update<CR>

" Save file if modified and quit
nnoremap <silent> <Leader>q :xit<CR>

" Manipulate tabs
nnoremap <silent> <Leader>tq :tabclose<CR>
nnoremap <silent> <Leader>to :tabonly<CR>
nnoremap <silent> <Leader>th :tabmove -<CR>
nnoremap <silent> <Leader>tj :tabprevious<CR>
nnoremap <silent> <Leader>tk :tabnext<CR>
nnoremap <silent> <Leader>tl :tabmove +<CR>

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

" Vertical help window
cnoremap vh vertical help

lua require('maps')
