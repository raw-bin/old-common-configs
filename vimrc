" Vundle configuration
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'myusuf3/numbers.vim'
Bundle 'rking/ag.vim'
Bundle 'steffanc/cscopemaps.vim'
Bundle 'tabular'

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
set incsearch
set smartcase

" Colors
let g:solarized_termcolors=256
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
syntax enable

" Swap, backup and undo files
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" File type specific mods
autocmd BufEnter *.txt set fo=qwarntc tw=68 smartindent autoindent

" Advanced
set showtabline=2
set ruler
let mapleader=","
set backspace=indent,eol,start

filetype plugin indent on     " required
