set nocompatible              " be iMproved, required

call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'jlanzarotta/bufexplorer'
Plug 'myusuf3/numbers.vim'
Plug 'rking/ag.vim'
Plug 'steffanc/cscopemaps.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vivien/vim-addon-linux-coding-style'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'racer-rust/vim-racer'
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
autocmd Filetype text	set fo=qwarntc tw=68 autoindent nocindent nosmartindent
autocmd Filetype mail	set fo=qwarntc tw=68 autoindent nocindent nosmartindent
autocmd Filetype python set ts=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

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

" Custom keybindings
noremap <leader>q :Ag <cword><CR>

filetype plugin indent on     " required

" FZF mods
nnoremap <C-p> :FZF<CR>
nnoremap <C-l> :Rg<CR>

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

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
