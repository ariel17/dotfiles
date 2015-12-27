" 
" ViM configuration file
" ======================
"

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
set history=500  " 500 commands to remember
set ruler  " show the cursor position all the time
set showcmd  " display incomplete commands
set incsearch  " do incremental searching
set encoding=utf-8

" Enabling colors in console
if (!has("gui_running"))
    set t_Co=256
    set term=screen-256color
endif

" Switch syntax highlighting on.
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" Colors
syntax enable
colorscheme lucius
highlight Comment term=bold ctermfg=2
highlight Constant term=underline ctermfg=7

" Warning and Danger sections
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = ","

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Line numbers
set number
set numberwidth=5

" case only matters with mixed case expressions
set ignorecase
set smartcase

" split configurations
set splitright
set splitbelow

"
" Import other/custom configurations
" 
source $HOME/.vim/config/vundle.vim
source $HOME/.vim/config/maps.vim
source $HOME/.vim/config/eclim.vim
source $HOME/.vim/config/nerdtree.vim
source $HOME/.vim/config/vim-latex.vim
source $HOME/.vim/config/pymode.vim
source $HOME/.vim/config/pdv-standalone.vim
source $HOME/.vim/config/chef.vim
source $HOME/.vim/config/airline.vim
source $HOME/.vim/config/files.vim
