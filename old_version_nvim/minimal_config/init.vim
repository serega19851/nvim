set mouse=a  " enable mouse
set encoding=utf-8
set number
set noswapfile
set scrolloff=7

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files

" for tabulation
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

inoremap jk <esc>
" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " vertical split window when Enter pressed on file

" Automatically format frontend files with prettier after file save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Disable quickfix window for prettier
let g:prettier#quickfix_enabled = 0

" Turn on vim-sneak
let g:sneak#label = 1

set relativenumber
set rnu
colorscheme slate

" Go to next or prev tab by H and L accordingly
nnoremap H gT
nnoremap L gt
syntax on
set clipboard=unnamed

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
