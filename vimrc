" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}
" NERD TREE
Plugin 'The-NERD-tree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

syntax on

set encoding=utf-8

" space & tabs
set tabstop=4
set softtabstop=4
set expandtab

" UI config
set nu
set cursorline
filetype indent on
set wildmenu

" searching
set incsearch
set hlsearch

" mouse
set mouse=a

" color scheme
color happy_hacking

" NERD Tree Setting
let NERDTreeIgnore=['\.pyc$', '\~$']

" keymap
nnoremap <F10> : NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
