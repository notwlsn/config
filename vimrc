set encoding=utf-8

syntax on

" show full file path
set laststatus=2

" set statusline+=%F
set statusline=%r%F\ \ \ \ \%=LINE:\ %l/%L/%P\ \ \TIME:\ %{strftime('%c')}

set tabstop=4
set expandtab
set shiftwidth=4
set smarttab

set nu
set cursorline
set wrap

" F4 for paste toggling
set pastetoggle=<F4>
set visualbell

set noshowmode

" mouse wheel scrolling support
set mouse=a

" terminal colors -> 256
set t_Co=256

" Checks current and parent directories up to / for ctags file (but does not
" recurse)
set tags=tags;/

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colorscheme changer
Plugin 'flazz/vim-colorschemes'

Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" the one syntax plugin to rule them all
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on

" Colorscheme choice (from flazz/vim-colorschemes)
" choice list is located at https://github.com/flazz/vim-colorschemes/tree/master/colors
colorscheme happy_hacking

set noshowmode

let g:vim_markdown_frontmatter = 1

let g:tex_conceal = ""

set incsearch
set hlsearch
set smartcase

" spelling settings
set spelllang=en_us

" set 5 lines padding above and below the cursor even when scrolling
set scrolloff=5
" set the vertical split character to the same one as tmux
set fillchars+=vert:│

" set persistent undo
set undofile
set undodir=~/.vim/undo
set undoreload=10000
set undolevels=1000

" general ease of use bindings
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <F3> :noh

let mapleader = "\<Space>"

nnoremap <leader>/ :noh<CR>
nnoremap <leader>; $a;<C-C>

" C bindings for commenting
map <C-C> :s:^:\/\/<CR>
map <C-A> :s:^\/\/<CR>
