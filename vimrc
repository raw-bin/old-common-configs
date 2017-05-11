set nocompatible              " be iMproved, required

call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'jlanzarotta/bufexplorer'
Plug 'myusuf3/numbers.vim'
Plug 'rking/ag.vim'
Plug 'steffanc/cscopemaps.vim'
Plug 'tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vivien/vim-addon-linux-coding-style'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" General
set linebreak
set textwidth=72
set shiftwidth=4
set softtabstop=4
set showmatch
set visualbell
set autoindent
set smartindent
set smarttab
set cindent
set number

set hlsearch
set ignorecase
set smartcase
set incsearch
"set autochdir

" Colors
set t_Co=256
let g:solarized_termcolors=256
highlight clear
syntax enable
set background=dark
colorscheme solarized
set laststatus=2
set ttimeoutlen=50

" Swap, backup and undo files
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" File type specific mods
autocmd Filetype text	set fo=qwarntc tw=68 autoindent nocindent nosmartindent
autocmd Filetype mail	set fo=qwarntc tw=68 autoindent nocindent nosmartindent
autocmd Filetype python set ts=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" Advanced
set showtabline=2
set ruler
let mapleader=","
set backspace=indent,eol,start
set timeout timeoutlen=3000 ttimeoutlen=100

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

filetype plugin indent on     " required

" Ctrlp mods
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
