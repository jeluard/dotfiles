set nocompatible
set autoindent
set hls
set showmatch
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'dgrnbrg/vim-redl.git'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'chriskempson/base16-vim'
Bundle 'noprompt/lite-brite'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-sensible'
"http://bytefluent.com/vivify/
"run vim +BundleInstall +qall to install new bundles

filetype plugin on
filetype indent on
syntax on
"colorscheme base16-default
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

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
set listchars=tab:→\ ,trail:·
set list
set showbreak=↪

set history=1000
" set spell
set cursorline
set pastetoggle=<F2> "http://vim.wikia.com/wiki/VimTip906
