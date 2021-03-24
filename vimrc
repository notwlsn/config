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
set wrap linebreak

" backup
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/tmp/backup or . if all else fails.
if isdirectory($HOME . '/.vim/tmp/backup') == 0
  :silent !mkdir -p ~/.vim/tmp/backup >/dev/null 2>&1
endif
set backupdir=./.vim-backup/,~/.vim/tmp/backup/,.
set backup

" swap
" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/tmp/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/tmp/swap') == 0
  :silent !mkdir -p ~/.vim/tmp/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//,~/.vim/tmp/swap//,~/tmp//,.
set swapfile

" persistent undo
if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/tmp/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/tmp/undo') == 0
    :silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//,~/.vim/tmp/undo//
  set undofile
endif

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
set rtp+=~/.fzf
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

" NERDTree plugins
Plugin 'preservim/nerdtree'

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

" Global 'map' bindings
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <F3> :noh
set pastetoggle=<F4> " Toggle paste
map <F5> :NERDTree<CR> " Open NerdTree
map <C-p> :source ~/.vimrc<CR> " Source config
map <C-f> :FZF<CR> " Finding file within a directory

" C bindings for commenting
map <C-C> :s:^:\/\/<CR>
map <C-A> :s:^\/\/<CR>

" Leader bindings
let mapleader = "\<Space>"
" No highlight
nnoremap <leader>/ :noh<CR>
" Append trailing semicolon
nnoremap <leader>; $a;<C-C>

" Bindings for tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
map  <C-q> :tabclose<CR>

" Bindings for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
