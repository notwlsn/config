set encoding=utf-8

syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

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

" Disable audio bell.
set noerrorbells visualbell t_vb=k

set noshowmode

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Disable highlight searching while not in active search.
:nohls

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" mouse wheel scrolling support
set mouse+=a

" terminal colors -> 256
set t_Co=256

" Checks current and parent directories up to / for ctags file (but does not
" recurse)
set tags=tags;/

" If Vim is loaded with ~/.vimrc present, it *should* be in nocompatible mode.
" Just in case it isn't.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
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
" Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" https://github.com/easymotion/vim-easymotion
Plugin 'easymotion/vim-easymotion'

" NERDTree plugins
Plugin 'preservim/nerdtree'

" the one syntax plugin to rule them all
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on

" Colorscheme choice (from flazz/vim-colorschemes)
" choice list is located at https://github.com/flazz/vim-colorschemes/tree/master/colors
colorscheme happy_hacking

let g:vim_markdown_frontmatter = 1

let g:tex_conceal = ""

set smartcase

" spelling settings
set spelllang=en_us

" set 5 lines padding above and below the cursor even when scrolling
set scrolloff=5

" set the vertical split character to the same one as tmux
set fillchars+=vert:│

" map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <F2> :noh

" Toggle paste.
set pastetoggle=<F4> 

" Open NERDTree interface.
map <F5> :NERDTree<CR>

" Source config
map <C-p> :source ~/.vimrc<CR> 

" Fuzzy file searching using FZF.
map <C-f> :FZF<CR> 

" C bindings for commenting
map <C-C> :s:^:\/\/<CR>
map <C-A> :s:^\/\/<CR>

" Leader bindings
let mapleader = "\<Space>"
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

" Never want 'Q' in normal mode entering Ex mode.
nmap Q <Nop>

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. I find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

