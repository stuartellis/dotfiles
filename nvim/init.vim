
" * Interface customizations

" Use comma as the leader key
let mapleader = ","

" Show line numbers
set number

" Default tabs and spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Convert tabs to spaces
set expandtab

" * Settings for Vim features
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb

" * Settings for plugins

" ALE
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\}

" * Put these lines at the very end of your configuration file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
