set autoindent
set hls
set showmatch

" VimClojure magic
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/VimClojure'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'chriskempson/base16-vim'

filetype plugin on
filetype indent on
syntax on
colorscheme base16-default

let g:Powerline_symbols = 'fancy'
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#DynamicHighlighting=1
let g:vimclojure#HighlightContrib=1
let g:vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1

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

set history=1000
" set spell
set cursorline
set pastetoggle=<F2> "http://vim.wikia.com/wiki/VimTip906
