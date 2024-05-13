set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos
set autoread
set number
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set laststatus=2
set list
set listchars=tab:»-,space:･,trail:･,nbsp:%,eol:↲,extends:»,precedes:«

nnoremap gf gF

nnoremap <Space>n :<C-u>nohlsearch<CR>

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap x "_x
xnoremap x "_x

inoremap <C-l> <Del>

nnoremap ; :
nnoremap : ;
nnoremap q; q:
xnoremap ; :
xnoremap : ;

filetype plugin indent on
syntax enable
