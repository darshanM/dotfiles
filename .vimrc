set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" do I need this colour scheme?
Plugin 'jnurmine/Zenburn'
Plugin 'nvie/vim-flake8'
" show file tree
Plugin 'scrooloose/nerdtree'
" fuzzy file matching
Plugin 'ctrlpvim/ctrlp.vim'
" autocomplete for python
Plugin 'Valloric/YouCompleteMe'
" Buffer explorer
Plugin 'jlanzarotta/bufexplorer'
" Grep within vim
Plugin 'mhinz/vim-grepper'
" Tmux within vim
Plugin 'benmills/vimux'
" defines helper methods for vimux and nosetest bindings
Plugin 'pitluga/vimux-nose-test'
" class outlines viewer
Plugin 'majutsushi/tagbar'
" Git plugin
Plugin 'tpope/vim-fugitive'
" Syntax checking plugin
Plugin 'w0rp/ale'
" fuzzy finding using fzf
" remains a TODO
" Plugin 'junegunn/fzf.vim'
Plugin 'darshanM/py_vimux'

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
set nonumber

" tagbar needs for this to be lesser
" than the default value of 5000
set updatetime=500

" Ctrl n + Ctrl n to toggle line numbers
nnoremap <C-N><C-N> :set invnumber<CR>

" controls tab behaviour to not autocomplete to first match
set wildmode=longest,list,full
set wildmenu
" uncomment below when path to code is determined
" set path+=~/workbench/code

" change leader from \ to ,
let mapleader=","

set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" open nerdtree automatically
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open Nerdtree on Leader + n + t
map <Leader>nt :NERDTreeToggle<CR>
" open Nerdtree find Leader + n + t
map <Leader>nf :NERDTreeFind<CR>

" open Nerdtree on Leader t
map <Leader>t :TagbarToggle<CR>

" open ctrlP on ctrl....p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" ignore files in .gitignore for CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" CTRL+l opens the buffer list using bufexplorer
map <C-l> <esc>:BufExplorer<cr>

" Ctrl-w + m maximizes windows
nmap <C-W>m <C-W>\|
" Ctrl-w + = equalizes them back

" I want to exclude files from gitgrep, but havent got this
" working yet :\
" let g:grepper = {}
" let g:grepper.git = { 'grepprg': 'git grep -nI --exclude-standard' }

" , + g does a 'git grep'
nnoremap <leader>g :Grepper -tool git<cr>
" , + * searches for word under cursor
nnoremap <leader>* :Grepper -tool git -open -switch -cword -noprompt<cr>

" adds a tracepoint and saves
nnoremap <leader>tr oimport ipdb; ipdb.sset_trace()<Esc>:w<cr>

" , + b does a blame
nnoremap <leader>b :Gblame<cr>

" make backspace work normally - default mode 
" doesnt allow for backspace deletes to maintain indents
set backspace=indent,eol,start

" do not show preview for youcompleteme
set completeopt-=preview

let b:ale_linters = ['flake8']
" 501:line length; E402 module level import not top of file
let g:ale_python_flake8_options = '--ignore=E501,E402'

" for clear white space leader+c+w

" vimuxy things
let g:vimux_nose_setup_cmd="echo 'run tests here'"
let g:vimux_nose_options="--nologcapture"
" map <Leader>rs :call VagrantSsh()<CR>
" replacing with py_vimux

map <Leader>rs :CreateTmuxPane<CR>

let g:vimux_nose_options="--nologcapture"
" map <Leader>rd :call CdAppRoot()<CR>
" map <Leader>ri :call VimuxInspectRunner()<CR>
" map <Leader>rc :call VimuxCloseRunner()<CR>
map <Leader>rr :call VimuxRunLastCommand()<CR>

autocmd FileType python map <Leader>ra :RunFile<CR>
autocmd FileType python map <Leader>rF :RunClass<CR>
autocmd FileType python map <Leader>rf :RunTest<CR>

" Tagbar needs exuberant ctags. So, I had to get it and set its
" path here - brew install ctags-exuberant
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

let g:setup_test_runner_cmd=''
let g:setup_cmd='vagrant ssh;'

:function VagrantSsh()
: call VimuxRunCommand('vagrant ssh') 
:endfunction

:function CdAppRoot()
: call VimuxRunCommand('cd $APPROOT') 
:endfunction
