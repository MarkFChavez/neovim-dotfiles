" Using vim-plug as plugin manager
call plug#begin()
Plug 'overcache/NeoSolarized'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'mhinz/vim-grepper'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
call plug#end()

" Load lua config
lua require("config")

let mapleader=","

filetype plugin indent on

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set clipboard=unnamed

" Standard config
set number
set relativenumber
set termguicolors
set noswapfile
set nohlsearch
set incsearch

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
			\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Fugitive custom mappings
nnoremap :Gbl<cr> <cmd>Git blame<cr>

nnoremap ,, <C-^>

" floaterm.vim
nnoremap <leader>f <cmd>FloatermToggle<cr>

" Telescope.nvim -- Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope find_files<cr>
nnoremap <C-p> <cmd>Telescope git_files<cr>

" Nvim-Tree
nnoremap <leader><Tab> <cmd>NvimTreeToggle<cr>

" NERDTree
" nnoremap <leader><Tab> <cmd>NERDTree<cr>

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

" typescript-vim
let g:typescript_indent_disable=1

" NeoSolarized.vim
colorscheme NeoSolarized
set background=light

" Tokyonight
" colorscheme tokyonight-night

" Remap keys for horizontal and vertical splits
nnoremap ss <cmd>spl<cr>
nnoremap vv <cmd>vspl<cr>

" Easier split navigations
" link: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
