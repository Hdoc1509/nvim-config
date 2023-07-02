nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>ps :PlugStatus<CR>
nnoremap <Leader>pud :PlugUpdate<CR>
nnoremap <Leader>pug :PlugUpgrade<CR>

call plug#begin()

" Plenary
Plug 'nvim-lua/plenary.nvim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Status Bar
Plug 'itchyny/lightline.vim'

" Nvim-tree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'rafamadriz/friendly-snippets'
Plug 'matze/vim-move'
Plug 'mhartington/formatter.nvim'
Plug 'kylechui/nvim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'folke/todo-comments.nvim'

" Themes
Plug 'EdenEast/nightfox.nvim'

" Packages
Plug 'williamboman/mason.nvim'
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'b0o/schemastore.nvim'
Plug 'chrisbra/unicode.vim'
Plug 'abecodes/tabout.nvim' | " should be load after nvim-cmp

" IDE
Plug 'lewis6991/gitsigns.nvim'
Plug 'junegunn/fzf'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'rest-nvim/rest.nvim'
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
Plug 'luukvbaal/statuscol.nvim'
Plug 'nanozuki/tabby.nvim'

" GIT
Plug 'tpope/vim-fugitive'

" GUI
Plug 'equalsraf/neovim-gui-shim'
Plug 'lukas-reineke/virt-column.nvim'
Plug 'brenoprata10/nvim-highlight-colors'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rcarriga/nvim-notify'

call plug#end()

lua require('plugins')
