set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                   " enable spell check
set backupdir=~/.cache/vim  " Directory to store backup files.
set fileformats=unix,dos,mac
syntax on                   " syntax highlighting
filetype plugin on
filetype plugin indent on   " allow auto-indenting depending on file type
" set noswapfile              " disable creating swap file


:tnoremap <M-h> <C-\><C-N><C-w>h
:tnoremap <M-j> <C-\><C-N><C-w>j
:tnoremap <M-k> <C-\><C-N><C-w>k
:tnoremap <M-l> <C-\><C-N><C-w>l
:inoremap <M-h> <C-\><C-N><C-w>h
:inoremap <M-j> <C-\><C-N><C-w>j
:inoremap <M-k> <C-\><C-N><C-w>k
:inoremap <M-l> <C-\><C-N><C-w>l
:nnoremap <M-h> <C-w>h
:nnoremap <M-j> <C-w>j
:nnoremap <M-k> <C-w>k
:nnoremap <M-l> <C-w>l


call plug#begin()
    Plug 'sainnhe/sonokai'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'https://github.com/preservim/nerdtree.git'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    Plug 'https://github.com/ivalkeen/nerdtree-execute.git'
    Plug 'https://github.com/APZelos/blamer.nvim.git'
    Plug 'rhysd/git-messenger.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale'
call plug#end()

colorscheme sonokai

" NERD Tree configuration
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
    execute "\<c-t>"
  endif
endfunction

if argc() != 0
        let f = escape(fnameescape(argv(0)), '.')
        if f == "pr"
            autocmd VimEnter * NERDTree
        endif
endif


" ALE configuration
let b:ale_fixers = ['prettier', 'eslint']


" Terminal configuration
let g:term_buf = 0
let g:term_win = 0


