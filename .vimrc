source $VIMRUNTIME/defaults.vim
if &compatible
  set nocompatible
endif
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

filetype on
syntax enable

set ttyfast
set hidden
set laststatus=2
set display=lastline
set cursorline
set number
set termguicolors
set background=dark

set incsearch

set mouse=a

set backup
set updatecount=100
set undofile
