" Lean classic-Vim config. Neovim lives separately under shell/nvim (LazyVim).
" No LSP, no compilation, no language runtime deps.

call plug#begin('~/.dotfiles/shell/vim/plugged')

Plug 'tpope/vim-fugitive'                   " git
Plug 'tpope/vim-commentary'                 " gcc / gc{motion}
Plug 'tpope/vim-surround'                   " cs'\" ds( ysiw]
Plug 'Raimondi/delimitMate'                 " auto-close pairs
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                     " :Files :Rg :Buffers
Plug 'itchyny/lightline.vim'                " statusline (mirrors nvim's lualine)
Plug 'crusoexia/vim-monokai'                " colorscheme

call plug#end()

" Auto-install any missing plugins on launch
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | source $MYVIMRC
  \| endif

filetype plugin indent on
syntax on

silent! colorscheme monokai

set nocompatible
set autoread
set encoding=utf8
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set backspace=indent,eol,start

" Leader
let mapleader = ','
let g:mapleader = ','
inoremap jk <Esc>

" Indent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smartindent

" UI
set number
set cursorline
set showcmd
set ttyfast
set lazyredraw
set laststatus=2
set noshowmode              " lightline shows it
set scrolloff=7
set cmdheight=1
set title
set showmatch
set mat=2
set wrap
set showbreak=↪
set synmaxcol=256

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

" Files
set nobackup
set noswapfile
set clipboard=unnamed       " macOS-friendly

if has('mouse')
    set mouse=a
endif

" Whitespace toggle
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
nnoremap <leader>ic :set list!<CR>

" Windows
nnoremap <leader>w <C-W>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <BS> <C-W>h

" Tabs
nnoremap <leader>tj :tabfirst<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprev<CR>
nnoremap <leader>tk :tablast<CR>
nnoremap <leader>tn :tabnew<Space>
nnoremap <leader>tt :tabedit<Space>
nnoremap <leader>td :tabclose<CR>

" Terminal (nvim only — harmless to leave for plain vim)
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" fzf
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>

" lightline — mirror lualine's segment layout
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left':  [ ['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'] ],
  \   'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
  \ },
  \ 'component_function': { 'gitbranch': 'FugitiveHead' }
  \ }
