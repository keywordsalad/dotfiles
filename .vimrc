" BEGIN VUNDLE

set rtp+=/usr/local/opt/fzf

set nocompatible              " be iMproved, required
filetype off                  " required here, changed below

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required, changed here
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" END VUNDLE
Plugin 'scrooloose/nerdtree'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'itchyny/lightline.vim'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'tpope/vim-surround'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Yggdroot/indentline'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'arcticicestudio/nord-vim'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'junegunn/fzf.vim'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'godlygeek/tabular'

" Command aliases
:source ~/.vim/scripts/cmdalias.vim
:Alias nt NERDTree

:syntax on

set ignorecase
set hlsearch
set ruler

set tabstop=4
set softtabstop=4
set shiftwidth=4 " indent/dedent by spaces
set expandtab

autocmd FileType gitconfig setlocal noexpandtab ts=4 sts=4 sw=4
autocmd FileType hs        setlocal   expandtab ts=2 sts=2 sw=2
autocmd FileType rb        setlocal   expandtab ts=2 sts=2 sw=2
autocmd FileType py        setlocal   expandtab ts=4 sts=4 sw=4
autocmd FileType go        setlocal noexpandtab ts=4 sts=4 sw=4
autocmd FileType cpp       setlocal   expandtab ts=2 sts=2 sw=2
autocmd FileType hpp       setlocal   expandtab ts=2 sts=2 sw=2
autocmd FileType yaml      setlocal   expandtab ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead Brewfile,*.Brewfile set syntax=ruby

