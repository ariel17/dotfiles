" Visuals
set number  " show line numbers
set ruler  " cursor position
set cursorline  " highlight current line
set colorcolumn=80  " 80 chars mark
set hlsearch
set noerrorbells
set novisualbell
set t_vb=

" Encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Language spell check
set spelllang=es,en

" Customized input
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Persistent undo 
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab

set backspace=indent,eol,start
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.apib setlocal textwidth=80

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Airline
set laststatus=2
set t_Co=256
set noshowmode
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0"
let g:syntastic_ignore_files = ['\.py$']


" vim-go
augroup auto_go
	autocmd!
	autocmd BufWritePost *.go :GoBuild
    " autocmd BufWritePost *_test.go :GoTest
augroup end
set autowrite

setlocal omnifunc=go#complete#Complete

let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_textobj_include_function_doc = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 1
let g:go_metalinter_autosave = 0
" let g:go_metalinter_enabled = ['vet', 'errcheck', 'golint']
let g:syntastic_go_checkers = ['go', 'vet', 'golint', 'errcheck']

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>t <Plug>(go-def-tab)


" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" UltiSnips and supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:UltiSnipsSnippetDirectories      = ["UltiSnips", $HOME.'/.vim/vim-snippets']

" python-mode
let g:pymode_python = 'python3'
let g:pymode_folding = 0


au BufWriteCmd *.py write || :PymodeLint
