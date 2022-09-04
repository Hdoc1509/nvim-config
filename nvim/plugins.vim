call plug#begin('~/AppData/Local/nvim/plugged')

" Syntax
Plug 'sheerun/vim-polyglot'

" Status Bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Themes
Plug 'EdenEast/nightfox.nvim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'scrooloose/nerdcommenter'

" GIT
Plug 'tpope/vim-fugitive'

" GUI
Plug 'equalsraf/neovim-gui-shim' 

" Icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

