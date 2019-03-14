" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERD TREE
Plugin 'The-NERD-tree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

syntax on

set encoding=utf-8
set autochdir

" space & tabs
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" UI config
set nu
set cursorline
filetype indent on
set wildmenu
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" searching
set incsearch
set hlsearch

" mouse
set mouse=a

" color scheme
color dracula

set noswapfile

set clipboard=unnamedplus

" NERD Tree Setting
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowHidden=1

" ctags
set tags=./tags,tags;

" keymap
let mapleader=" "
nnoremap <leader>f : NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
