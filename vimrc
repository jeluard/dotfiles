set nocompatible
set autoindent
set hls
set showmatch

filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()

Bundle 'Lokaltog/vim-easymotion'
"Leader Leader w, gE, t
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/powerline'
Bundle 'noprompt/lite-brite'
Bundle 'tpope/vim-sensible'
Bundle 'sjl/gundo.vim'
Bundle 'tristen/vim-sparkup'
" c-e, c-n
Bundle 'mattn/gist-vim'
Bundle 'mhinz/vim-signify'
"Leader gh, gj, gk

filetype plugin on
filetype indent on
syntax on
colorscheme litebrite

let g:Powerline_symbols = 'fancy'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" Indentation: spaces only, 2 spaces indentation http://vim.wikia.com/wiki/Indenting_source_code
" http://vimdoc.sourceforge.net/htmldoc/indent.html
set expandtab
set shiftwidth=2
set softtabstop=2
set encoding=utf-8
set laststatus=2
set relativenumber
set noundofile

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
set listchars=tab:→\ ,trail:·
set list
set showbreak=↪
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

set history=1000
set cursorline
set scrolloff=3
set pastetoggle=<F2> "http://vim.wikia.com/wiki/VimTip906
nnoremap <F5> :GundoToggle<CR>

let mapleader = ","

au FocusLost * :wa "save on focus lost

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <Nul> <C-x><C-o>

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
