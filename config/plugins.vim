call plug#begin()

" Plenary
Plug 'nvim-lua/plenary.nvim'

" Syntax
Plug 'sheerun/vim-polyglot'

" Status Bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Tree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'mattn/emmet-vim'
Plug 'rafamadriz/friendly-snippets'
Plug 'matze/vim-move'
Plug 'mhartington/formatter.nvim'
Plug 'kylechui/nvim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'folke/todo-comments.nvim'

" Themes
Plug 'EdenEast/nightfox.nvim'

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
Plug 'onsails/lspkind.nvim'

" IDE
Plug 'gpanders/editorconfig.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'junegunn/fzf'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" GIT
Plug 'tpope/vim-fugitive'

" GUI
Plug 'equalsraf/neovim-gui-shim'
Plug 'lukas-reineke/virt-column.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rcarriga/nvim-notify'

call plug#end()

call SourceConfig('plugins-config')
