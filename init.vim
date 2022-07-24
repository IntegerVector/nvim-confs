" General settings:
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line
set number relativenumber   " add line numbers
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
" set noswapfile            " disable creating swap file


" Navigation settings:
" use option+hjkl to move between split/vsplit panels
" IMPORTANT: it works only with MacOS!
tnoremap ˙ <C-\><C-n><C-w>h
tnoremap ∆ <C-\><C-n><C-w>j
tnoremap ˚ <C-\><C-n><C-w>k
tnoremap ¬ <C-\><C-n><C-w>l
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

" IMPORTANT: it doesn't works on MacOS!
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l


" Terminal settings:
set splitright
set splitbelow

tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" Plugins:
call plug#begin("~/.vim/plugged")
    Plug 'sainnhe/sonokai'
    Plug 'https://github.com/preservim/nerdtree.git'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    Plug 'https://github.com/ivalkeen/nerdtree-execute.git'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'https://github.com/APZelos/blamer.nvim.git'
    Plug 'rhysd/git-messenger.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'dense-analysis/ale'
call plug#end()

colorscheme sonokai

" NERD Tree configuration
let g:NERDTreeWinSize=35
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" ALE configuration
let b:ale_fixers = ['prettier', 'eslint']


" COC configuration
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']


" FZF File search configuration
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Requires 'silversearcher-ag' package!!!
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" Git blamer configuration
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0


