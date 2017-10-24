set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'jnurmine/Zenburn'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

call vundle#end() 
filetype plugin indent on

syntax enable
set tabstop=4
set expandtab
set number
set background=dark
set softtabstop=4
set shiftwidth=4
let python_highlight_all = 1
set showmatch
set autoindent
let python_highlight_all = 1
set cursorline


" controls tab behaviour to not autocomplete to first match
set wildmode=longest,list,full
set wildmenu
set path+=~/workbench/tablet/bin,~/workbench/tablet/lib/python,~/workbench/tablet/share/http/web_tablethotels


set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
