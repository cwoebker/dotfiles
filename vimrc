call pathogen#runtime_append_all_bundles()  " adding pathogen to vimrc
call pathogen#helptags()

set nocompatible                    " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                         " display incomplete commands
filetype plugin indent on           " load file type plugins + indentation

"" Whitespace
set nowrap                          " don't wrap lines
set tabstop=4 shiftwidth=4          " a tab is two spaces (or set this to 4)
set expandtab                       " use spaces, not tabs (optional)
set backspace=indent,eol,start      " backspace through everything in insert mode
set autoindent
set smarttab

"" History
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc.*.class
set title

"" Stupid Backup stuff
set nobackup
set noswapfile

"SWAGG
set paste                           " setting good paste
set number                          " setting line numbers

"" Searching
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter

"" Mappings
nmap <F8> :TagbarToggle<CR>         " mapping f8 to TagbarToggle
nmap <F2> :NERDTreeToggle<CR>       " mapping f2 to NERDTreeToggle
noremap <F5> :GundoToggle<CR>       " mapping f5 to Gundo
noremap <F9> :Gcommit<CR>           " mapping f9 to Gcommit
inoremap jj <Esc>                   "<Esc> to jj


" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

"" Mapping 
let mapleader = ","                 " setting leader to , 

"" Color Scheme
colorscheme wombat          " Tomorrow Theme

" Disable Pylint on Save
let g:pymode_lint_onfly = 1         " python-mode
let g:pymode_doc_key = 'K'

set laststatus=2                    " Always show the statusline

set mouse=a

" Enable fancy mode 
let g:Powerline_symbols = 'fancy'   " Powerline
