"
" Minimal Vim settings
"
" Borrowed from: https://github.com/tpope/vim-sensible 
"

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set laststatus=2
set ruler
set wildmenu
set incsearch

set display+=lastline

set autoread

inoremap <C-U> <C-G>u<C-U>

set number
