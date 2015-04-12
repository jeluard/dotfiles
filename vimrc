filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Better defaults
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-sleuth'
"Improved navigation. Leader w, gE, t, f
Bundle 'Lokaltog/vim-easymotion'
"Clojure support.
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/paredit.vim'
"Git integration.
Bundle 'tpope/vim-fugitive'
"Undo UI.
Bundle 'sjl/gundo.vim'
"Show git changes.  Leader gh, gj, gk
Bundle 'mhinz/vim-signify'
"Show character details.  ga
Bundle 'tpope/vim-characterize'
"File browser.
Bundle 'scrooloose/nerdtree'
"Color scheme
Bundle 'noahfrederick/vim-hemisu'
"Status bar
Bundle 'bling/vim-airline'
"Syntax Highlighting
Bundle 'elzr/vim-json'

"Enable rainbow parentheses support.
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

colorscheme hemisu

filetype plugin indent on
syntax on

" Indentation: spaces only, 2 spaces indentation http://vim.wikia.com/wiki/Indenting_source_code
" http://vimdoc.sourceforge.net/htmldoc/indent.html
set expandtab
set shiftwidth=2
set softtabstop=2
set encoding=utf-8
set laststatus=2
set number
set relativenumber
set completeopt=menuone,longest,preview
set splitbelow
set autoindent
set hls
set showmatch
set listchars=tab:→\ ,trail:·
set list
set showbreak=↪
set noshowmode
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
set undofile
set undodir=~/.vim/tmp
set clipboard=unnamed
set mouse=a

"Plugins configuration.
let NERDTreeQuitOnOpen=1
autocmd vimenter * if !argc() | NERDTree | endif

let g:EasyMotion_leader_key = '<Leader>'

"let g:paredit_electric_return=0

" Highlight cljx files as clojure
autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure

autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|pclose|endif

"Key mapping
let mapleader = ","
set pastetoggle=<F4> "http://vim.wikia.com/wiki/VimTip906
map <F2> :NERDTreeToggle<CR>
nnoremap <F3> :GundoToggle<CR>

"Change cursor shape in edit mode.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"Have cursor stay in place when leaving edit mode.
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Prevent usage of arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
