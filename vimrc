" Remap
imap jk <Esc>

" Don't try to be vi compatible
set nocompatible

filetype off

" Load plugins here (Vim Plug)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'robbles/logstash.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on

syntax on
set encoding=utf-8
set t_Co=256

let mapleader = " "

" Security
set modelines=0

" UI
set number
set ruler
set visualbell
set laststatus=2
set showmode
set showcmd
set scrolloff=3
set hidden

" Whitespace
set smartindent
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set backspace=indent,eol,start
set matchpairs+=<:>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Clear search on Enter
nnoremap <CR> :noh<CR><CR>

" Sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>

" Warn if plugins are missing (i.e. :PlugInstall hasn't been run)
if empty(glob('~/.vim/plugged'))
  autocmd VimEnter * echohl WarningMsg
    \ | echom "vim plugins not installed — run :PlugInstall"
    \ | echohl None
endif

" Colors — termguicolors must be set before colorscheme
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
try
  colorscheme palenight
catch /E185/
  colorscheme default
  autocmd VimEnter * echohl WarningMsg
    \ | echom "Colorscheme 'palenight' not found — run :PlugInstall"
    \ | echohl None
endtry
