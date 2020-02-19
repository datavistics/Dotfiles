" Remap
imap jk <Esc>

" Don't try to be vi compatible
set nocompatible
"
" " Helps force plugins to load correctly when it is turned back on below
filetype off
"
" Load plugins here (Vim Plug)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
" Theme
Plug 'drewtempelmeyer/palenight.vim'

" Nerd commenter
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

" May not be useful? 
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Logstash
Plug 'robbles/logstash.vim'

" Surround!
Plug 'tpope/vim-surround'

" Auto Pairs for parens
Plug 'jiangmiao/auto-pairs'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" Turn on syntax highlighting
syntax on

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Sudo write
" https://dev.to/jovica/the-vim-trick-which-will-save-your-time-and-nerves-45pg
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" " Color scheme (terminal)
set t_Co=256

"
" " For plugins to load correctly
" filetype plugin indent on
"
" " TODO: Pick a leader key
let mapleader = " "
"
" " Security
set modelines=0
"
" " Show line numbers
set number
"
" " Show file stats
set ruler
"
" " Blink cursor on error instead of beeping (grr)
set visualbell
"
" " Encoding
" set encoding=utf-8

" Indent
set smartindent
"
" " Whitespace
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=2
set expandtab
set noshiftround
"
" " Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
" runtime! macros/matchit.vim
"
" " Move up/down editor lines
nnoremap j gj
nnoremap k gk
"
" " Allow hidden buffers
set hidden
"
" " Rendering
" set ttyfast
"
" " Status bar
set laststatus=2
"
" " Last line
set showmode
set showcmd
"
" " Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" map <leader><space> :let @/=''<cr> " clear search
"
" " Remap help key.
" inoremap <F1> <ESC>:set invfullscreen<CR>a
" nnoremap <F1> :set invfullscreen<CR>
" vnoremap <F1> :set invfullscreen<CR>
"
" " Textmate holdouts
"
" " Formatting
" map <leader>q gqip
"
" " Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" " Uncomment this to enable by default:
" " set list " To enable by default
" " Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
"

set background=dark
colorscheme palenight

if (has("termguicolors"))                                                               
      set termguicolors                                                                     
endif
