" Using vim-plug as plugin manager
call plug#begin()
Plug 'overcache/NeoSolarized'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'mhinz/vim-grepper'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'f-person/git-blame.nvim'
Plug 'tpope/vim-rails'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

" Load lua config
lua require("config")

let mapleader=","

" git-blame.nvim
let g:gitblame_enabled = 0
nnoremap :Gbl <cmd>GitBlameToggle<cr>

" Standard config
set relativenumber
set termguicolors
set noswapfile
set nohlsearch
set autoread

nnoremap ,, <C-^>

" floaterm.vim
nnoremap <leader>f <cmd>FloatermToggle<cr>

" Telescope.nvim -- Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope find_files<cr>

" Nvim-Tree
nnoremap <leader><Tab> <cmd>NvimTreeToggle<cr>

" vim-grepper
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0
nnoremap <leader>g :Grepper -tool git<cr>

set splitbelow
set splitright

" NeoSolarized.vim
colorscheme NeoSolarized
set background=light

" Tokyonight
" colorscheme tokyonight-day

" Remap keys for horizontal and vertical splits
nnoremap ss <cmd>spl<cr>
nnoremap vv <cmd>vspl<cr>

" Easier split navigations
" link: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
