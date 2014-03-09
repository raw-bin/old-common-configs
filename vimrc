" Vundle configuration
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
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

" Advanced
set showtabline=2
set ruler
let mapleader=","

filetype plugin indent on     " required
