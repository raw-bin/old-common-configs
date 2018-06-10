set nocompatible              " be iMproved, required

call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'jlanzarotta/bufexplorer'
Plug 'myusuf3/numbers.vim'
Plug 'rking/ag.vim'
Plug 'steffanc/cscopemaps.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'racer-rust/vim-racer'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" General
set linebreak
set textwidth=120
set shiftwidth=4
set softtabstop=4
set showmatch
set visualbell
set autoindent
set smartindent
set smarttab
set cindent
set number

set ignorecase
set smartcase
set incsearch
set splitbelow
set splitright

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
autocmd Filetype text	setlocal fo=qwarntc tw=68 autoindent nocindent nosmartindent
autocmd Filetype mail	setlocal fo=qwarntc tw=68 autoindent nocindent nosmartindent
autocmd Filetype cpp	setlocal fo=qwarntc tw=72 smartindent autoindent tabstop=4 shiftwidth=4 expandtab

au BufEnter *.cpp setf cpp

" Advanced
set showtabline=2
set ruler
let mapleader=","
set backspace=indent,eol,start
set timeout timeoutlen=3000 ttimeoutlen=100
set clipboard=unnamedplus

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Rust
set hidden
let g:racer_cmd = "/home/robin/.cargo/bin/racer"

filetype plugin indent on     " required

" FZF mods
nnoremap <C-p> :FZF<CR>
nnoremap <C-l> :Rg<CR>

nnoremap <C-w>p :call SplitOutPaneToggle()<CR>
let g:pane_is_split_out = 0

function! SplitOutPaneToggle()
    if g:pane_is_split_out
	let savex=winsaveview()
	tabclose
	call winrestview(savex)
	let g:pane_is_split_out = 0
    else
	let savex=winsaveview()
	tabedit %
	let g:pane_is_split_out = 1
	call winrestview(savex)
    endif
endfunction

function! OpenTerminal()
   vsplit
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
endfunction

nnoremap <C-w>t :call OpenTerminal()<cr>

" Auto resize splits when parent window size changes
:autocmd VimResized * wincmd =

" Incsearch plugin mods
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

function! BGToggle()
    let &background = ( &background == "dark"? "light" : "dark" )
endfunction

nnoremap <leader>t :call BGToggle()<cr>
nnoremap <leader>w :Ag <cword><cr>
